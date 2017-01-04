module Fixtures
  module GossipEndpoint
    class Response
      include TestBench::Fixture

      initializer :member, :member_index

      def self.call(member, member_index)
        instance = new member, member_index
        instance.()
      end

      def call
        test "Is member" do
          assert member.instance_of?(EventStore::Clustering::GossipEndpoint::Response::Member)
        end

        test "Instance ID" do
          compare(
            member.instance_id,
            Controls::GossipEndpoint::Response::Member.instance_id(member_index)
          )
        end

        test "Timestamp" do
          compare(
            member.time_stamp,
            Controls::GossipEndpoint::Response::Member.time_stamp
          )
        end

        test "State" do
          compare(
            member.state,
            Controls::GossipEndpoint::Response::Member.state(member_index)
          )
        end

        test "Alive status" do
          compare(
            member.is_alive,
            Controls::GossipEndpoint::Response::Member.is_alive(member_index)
          )
        end

        test "Internal TCP IP adress" do
          compare(
            member.internal_tcp_ip,
            Controls::GossipEndpoint::Response::Member.internal_tcp_ip(member_index)
          )
        end

        test "Internal TCP port" do
          compare(
            member.internal_tcp_port,
            Controls::GossipEndpoint::Response::Member.internal_tcp_port
          )
        end

        test "Internal secure TCP port" do
          compare(
            member.internal_secure_tcp_port,
            Controls::GossipEndpoint::Response::Member.internal_secure_tcp_port
          )
        end

        test "External TCP IP adress" do
          compare(
            member.external_tcp_ip,
            Controls::GossipEndpoint::Response::Member.external_tcp_ip(member_index)
          )
        end

        test "External TCP port" do
          compare(
            member.internal_tcp_port,
            Controls::GossipEndpoint::Response::Member.internal_tcp_port
          )
        end

        test "External secure TCP port" do
          compare(
            member.external_secure_tcp_port,
            Controls::GossipEndpoint::Response::Member.external_secure_tcp_port
          )
        end

        test "Internal HTTP IP adress" do
          compare(
            member.internal_http_ip,
            Controls::GossipEndpoint::Response::Member.internal_http_ip(member_index)
          )
        end

        test "Internal HTTP port" do
          compare(
            member.internal_http_port,
            Controls::GossipEndpoint::Response::Member.internal_http_port
          )
        end

        test "External HTTP IP adress" do
          compare(
            member.external_http_ip,
            Controls::GossipEndpoint::Response::Member.external_http_ip(member_index)
          )
        end

        test "External HTTP port" do
          compare(
            member.internal_http_port,
            Controls::GossipEndpoint::Response::Member.internal_http_port
          )
        end

        test "Last commit position" do
          compare(
            member.last_commit_position,
            Controls::GossipEndpoint::Response::Member.last_commit_position
          )
        end

        test "Writer checkpoint" do
          compare(
            member.writer_checkpoint,
            Controls::GossipEndpoint::Response::Member.writer_checkpoint
          )
        end

        test "Chaser checkpoint" do
          compare(
            member.chaser_checkpoint,
            Controls::GossipEndpoint::Response::Member.chaser_checkpoint
          )
        end

        test "Epoch position" do
          compare(
            member.epoch_position,
            Controls::GossipEndpoint::Response::Member.epoch_position
          )
        end

        test "Epoch number" do
          compare(
            member.epoch_number,
            Controls::GossipEndpoint::Response::Member.epoch_number
          )
        end

        test "Epoch ID" do
          compare(
            member.epoch_id,
            Controls::GossipEndpoint::Response::Member.epoch_id
          )
        end

        test "Node priority" do
          compare(
            member.node_priority,
            Controls::GossipEndpoint::Response::Member.node_priority
          )
        end
      end

      def compare(value, control_value)
        comment "Comparing #{value.inspect} against #{control_value.inspect}" 

        assert value == control_value
      end
    end
  end
end
