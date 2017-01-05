module EventStore
  module Cluster
    module LeaderStatus
      class Data
        include Schema::DataStructure

        attribute :tcp_ip_address, String
        attribute :tcp_port, Integer

        attribute :http_ip_address, String
        attribute :http_port, Integer
      end
    end
  end
end
