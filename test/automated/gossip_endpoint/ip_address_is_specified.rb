require_relative '../automated_init'

context "Get Cluster Status From Gossip Endpoint, IP Address Is Specified" do
  ip_address = Controls::IPAddress.example

  get = EventStore::Clustering::GossipEndpoint::Get.build

  Controls::ResolveHost.configure get.connect_http

  response = get.(ip_address)

  test "Gossip endpoint query is performed against specified IP address" do
    assert response.server_ip == ip_address
  end
end
