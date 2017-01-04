module EventStore
  module Clustering
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
