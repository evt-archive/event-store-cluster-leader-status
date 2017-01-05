require_relative '../automated_init'

context "Gossip Endpoint Deserialization" do
  json_text = Controls::GossipEndpoint::Response::JSON.text

  response = Transform::Read.(
    json_text,
    :json,
    EventStore::Cluster::LeaderStatus::GossipEndpoint::Response
  )

  test "Server IP address" do
    assert response.server_ip == Controls::GossipEndpoint::Response.server_ip
  end

  test "Server port" do
    assert response.server_port == Controls::GossipEndpoint::Response.server_port
  end

  context "Leader member" do
    leader = response.leader

    Fixtures::GossipEndpoint::Response.(
      leader,
      Controls::GossipEndpoint::Response::Member::Index.leader
    )
  end

  (1..2).each do |follower_index|
    context "Follower member ##{follower_index}" do
      follower = response.followers[follower_index - 1]

      Fixtures::GossipEndpoint::Response.(
        follower,
        Controls::GossipEndpoint::Response::Member::Index.follower(follower_index)
      )
    end
  end
end
