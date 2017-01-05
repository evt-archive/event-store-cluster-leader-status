module EventStore
  module Clustering
    class GetLeaderStatus
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

        response = Response.new

        SetAttributes.(
          response,
          gossip_response.leader,
          copy: [
            { :external_tcp_ip => :tcp_ip_address },
            { :external_tcp_port => :tcp_port },
            { :external_http_ip => :http_ip_address },
            { :external_http_port => :http_port }
          ]
        )

        logger.info { "Get leader done (TCP: #{response.tcp_ip_address}:#{response.tcp_port}, HTTP: #{response.http_ip_address}:#{response.http_port})" }

        response
      end

      class Response
        include Schema::DataStructure

        attribute :tcp_ip_address, String
        attribute :tcp_port, Integer

        attribute :http_ip_address, String
        attribute :http_port, Integer
      end
    end
  end
end
