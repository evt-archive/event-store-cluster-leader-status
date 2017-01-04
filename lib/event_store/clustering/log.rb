module EventStore
  module Clustering
    class Log < ::Log
      def tag!(tags)
        tags << :event_store_clustering
        tags << :event_store
        tags << :verbose
      end
    end
  end
end
