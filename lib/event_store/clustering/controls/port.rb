module EventStore
  module Clustering
    module Controls
      module Port
        module TCP
          def self.example
            1113
          end

          module Internal
            def self.example
              TCP.example - 1
            end
          end
        end

        module HTTP
          def self.example
            EventStore::HTTP::Connect::Controls::Port.example
          end

          module Internal
            def self.example
              HTTP.example - 1
            end
          end
        end
      end
    end
  end
end
