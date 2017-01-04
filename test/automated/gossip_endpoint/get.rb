require_relative '../automated_init'

context "Get Cluster Status From Gossip Endpoint" do
  host = Controls::Hostname.example

  get = EventStore::Clustering::GossipEndpoint::Get.build

  Controls::ResolveHost.configure get.connect

  cluster_status = get.()

  context "Leader IP address" do
    test "Value is set to that of current cluster leader" do
      leader_ip_address, * = Controls::CurrentMembers.get

      assert cluster_status.leader_ip_address == leader_ip_address
    end
  end
end
