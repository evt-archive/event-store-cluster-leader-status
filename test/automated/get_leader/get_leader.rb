require_relative '../automated_init'

context "Get Cluster Leader" do
  connect_http = Controls::ConnectHTTP.example

  get_leader = EventStore::Clustering::GetLeader.build connect_http

  leader = get_leader.()

  leader_ip_address, * = Controls::CurrentMembers.get

  test "TCP address" do
    assert leader.tcp_ip_address == leader_ip_address
  end

  test "TCP port" do
    assert leader.tcp_port == Controls::Port::TCP.example
  end

  test "HTTP address" do
    assert leader.http_ip_address == leader_ip_address
  end

  test "HTTP port" do
    assert leader.http_port == Controls::Port::HTTP.example
  end
end