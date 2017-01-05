module EventStore
  module Cluster
    module LeaderStatus
      module GossipEndpoint
        class Get
          include Log::Dependency

          configure :get_gossip_endpoint

          dependency :connect_http, EventStore::HTTP::Connect

          def self.build(connect_http=nil)
            instance = new

            connect_http = EventStore::HTTP::Connect.configure(
              instance,
              connect: connect_http,
              attr_name: :connect_http
            )

            instance
          end

          def self.call(host=nil, connect_http=nil)
            instance = build connect_http
            instance.(host)
          end

          def call(host=nil)
            log_attributes = LogAttributes.get self, host: host

            logger.trace { "GET gossip endpoint (#{log_attributes})" }

            connection_telemetry = EventStore::HTTP::Connect.register_telemetry_sink connect_http

            connect_http.(host) do |connection|
              begin
                response = connection.request_get uri_path, http_headers
              rescue Net::ReadTimeout
                response = nil
              end

              if response
                log_attributes << ", StatusCode: #{response.code}, ReasonPhrase: #{response.message}"

                logger.debug { "GET gossip endpoint done (#{log_attributes})" }
                logger.trace { "Data: \n\n#{response.body}" }
              end

              if response.nil? or non_cluster? response
                error_message = "GET gossip endpoint made against non-clustered EventStore (#{log_attributes})"
                logger.error error_message
                raise NonClusterError, error_message
              end

              response = Transform::Read.(response.body, :json, Response)

              return response
            end
          end

          def uri_path
            '/gossip'
          end

          def http_headers
            { 'Accept' => 'application/json' }
          end

          def non_cluster?(response)
            response.code == '408' and response.message == "Server was unable to handle request in time"
          end

          NonClusterError = Class.new StandardError

          module LogAttributes
            def self.get(get_instance, host: nil)
              host_setting = get_instance.connect_http.host

              if host.nil?
                host_text = host_setting
              else
                host_text = "#{host} [Overriding setting: [#{host_setting}]]"
              end

              get_instance.instance_exec do
                "Host: #{host_text}"
              end
            end
          end
        end
      end
    end
  end
end
