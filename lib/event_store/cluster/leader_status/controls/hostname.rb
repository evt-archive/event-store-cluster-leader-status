module EventStore
  module Cluster
    module LeaderStatus
      module Controls
        Hostname = EventStore::HTTP::Connect::Controls::Cluster::Hostname

        module Hostname
          module NonCluster
            def self.example
              EventStore::HTTP::Connect::Controls::Hostname.example
            end
          end
        end
      end
    end
  end
end
