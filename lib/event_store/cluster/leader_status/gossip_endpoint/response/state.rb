module EventStore
  module Cluster
    module LeaderStatus
      module GossipEndpoint
        class Response
          module State
            def self.leader
              'Master'
            end

            def self.follower
              'Slave'
            end
          end
        end
      end
    end
  end
end
