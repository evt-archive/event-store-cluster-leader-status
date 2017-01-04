require_relative '../automated_init'

context "Get Cluster Status From Gossip Endpoint" do
  host = Controls::Hostname.example

  get = EventStore::Clustering::GossipEndpoint::Get.build

  Controls::ResolveHost.configure get.connect

  response = get.()

  context "Leader external TCP IP address" do
    test "Value is set to that of current cluster leader" do
      leader_ip_address, * = Controls::CurrentMembers.get

      assert response.leader.external_tcp_ip == leader_ip_address
    end
  end

  context "Leader external HTTP IP address" do
    test "Value is set to that of current cluster leader" do
      leader_ip_address, * = Controls::CurrentMembers.get

      assert response.leader.external_http_ip == leader_ip_address
    end
  end
end
