module EventStore
  module Clustering
    module GossipEndpoint
      class Get
        include Log::Dependency

        configure :get_status

        dependency :connect, EventStore::HTTP::Connect

        def self.build(settings=nil, namespace: nil)
          instance = new
          EventStore::HTTP::Connect.configure instance, settings, namespace: namespace
          instance
        end

        def self.call(host=nil)
          instance = build
          instance.(host)
        end

        def call(host=nil)
          log_attributes = LogAttributes.get self, host: host

          logger.trace { "GET gossip endpoint (#{log_attributes})" }

          connect.(host) do |connection|
            response = connection.request_get uri_path, http_headers

            log_attributes << ", StatusCode: #{response.code}, ReasonPhrase: #{response.message}"

            logger.debug { "GET gossip endpoint done (#{log_attributes})" }
            logger.trace { "Data: \n\n#{response.body}" }

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

        module LogAttributes
          def self.get(get_instance, host: nil)
            host_setting = get_instance.connect.host

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
