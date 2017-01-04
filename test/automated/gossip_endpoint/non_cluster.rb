require_relative '../automated_init'

context "Get Cluster Status From Gossip Endpoint, EventStore Is Non-Clustered" do
  host = Controls::Hostname::NonCluster.example
  ip_address = Controls::IPAddress::NonCluster.example

  context "Host is not specified" do
    connect_http = Controls::ConnectHTTP.example host: host, ip_addresses: [ip_address]

    get = EventStore::Clustering::GossipEndpoint::Get.build connect_http

    response = get.()

    test "Nothing is returned" do
      assert response == nil
    end
  end

  context "Host is specified" do
    get = EventStore::Clustering::GossipEndpoint::Get.build

    Controls::ResolveHost.configure get.connect_http, host: host, ip_addresses: [ip_address]
    get.connect_http.read_timeout = 0.1

    test "HTTP request times out" do
      assert proc { get.(host) } do
        raises_error? Net::ReadTimeout
      end
    end
  end
end
