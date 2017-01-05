module EventStore
  module Cluster
    module LeaderStatus
      class Get
        include Log::Dependency

        configure :get_leader_status

        dependency :get_gossip_endpoint, GossipEndpoint::Get

        def self.build(connect_http=nil)
          instance = new

          GossipEndpoint::Get.configure instance, connect_http

          instance
        end

        def self.call(*arguments)
          instance = build *arguments
          instance.()
        end

        def call
          logger.trace { "Getting leader" }

          gossip_response = get_gossip_endpoint.()

          if gossip_response.nil?
            logger.info { "Get leader done; EventStore is non-clustered" }
            return nil
          end

          data = Data.new

          SetAttributes.(
            data,
            gossip_response.leader,
            copy: [
              { :external_tcp_ip => :tcp_ip_address },
              { :external_tcp_port => :tcp_port },
              { :external_http_ip => :http_ip_address },
              { :external_http_port => :http_port }
            ]
          )

          logger.info { "Get leader done (TCP: #{data.tcp_ip_address}:#{data.tcp_port}, HTTP: #{data.http_ip_address}:#{data.http_port})" }

          data
        end
      end
    end
  end
end
