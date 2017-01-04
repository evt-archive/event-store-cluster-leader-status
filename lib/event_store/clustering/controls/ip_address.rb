module EventStore
  module Clustering
    module Controls
      IPAddress = EventStore::HTTP::Connect::Controls::Cluster::IPAddress

      module IPAddress
        module Leader
          def self.example
            IPAddress.example member_index
          end

          def self.member_index
            2
          end
        end
      end
    end
  end
end
