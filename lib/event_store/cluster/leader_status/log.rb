module EventStore
  module Cluster
    module LeaderStatus
      class Log < ::Log
        def tag!(tags)
          tags << :event_store_cluster_leader_status
          tags << :event_store_cluster
          tags << :event_store
          tags << :verbose
        end
      end
    end
  end
end
