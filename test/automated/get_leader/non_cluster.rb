require_relative '../automated_init'

context "Get Cluster Leader, EventStore Is Not Clustered" do
  host = Controls::Hostname::NonCluster.example
  ip_address = Controls::IPAddress::NonCluster.example

  connect_http = Controls::ConnectHTTP.example host: host, ip_addresses: [ip_address]

  get_leader = EventStore::Clustering::GetLeader.build connect_http

  leader = get_leader.()

  test "Nothing is returned" do
    assert leader == nil
  end
end
