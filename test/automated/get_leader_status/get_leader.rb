require_relative '../automated_init'

context "Get Cluster Leader" do
  connect_http = Controls::ConnectHTTP.example

  get_leader_status = EventStore::Cluster::LeaderStatus::Get.build connect_http

  leader_status = get_leader_status.()

  leader_ip_address, * = Controls::CurrentMembers.get

  test "TCP address" do
    assert leader_status.tcp_ip_address == leader_ip_address
  end

  test "TCP port" do
    assert leader_status.tcp_port == Controls::Port::TCP.example
  end

  test "HTTP address" do
    assert leader_status.http_ip_address == leader_ip_address
  end

  test "HTTP port" do
    assert leader_status.http_port == Controls::Port::HTTP.example
  end
end
