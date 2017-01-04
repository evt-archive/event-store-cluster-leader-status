module EventStore
  module Clustering
    module GossipEndpoint
      class Response
        include Schema::DataStructure

        attribute :leader_ip_address, String

        def digest
          "[leaderIPAddress: #{leader_ip_address}]"
        end
      end
    end
  end
end
