module EventStore
  module Clustering
    module Controls
      module ConnectHTTP
        def self.example(host: nil, ip_addresses: nil)
          connect = EventStore::HTTP::Connect.build
          connect.host = host if host
          ResolveHost.configure connect, host: host, ip_addresses: ip_addresses
          connect
        end
      end
    end
  end
end
