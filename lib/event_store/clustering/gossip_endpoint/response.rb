module EventStore
  module Clustering
    module GossipEndpoint
      class Response
        include Schema::DataStructure

        attribute :server_ip, String
        attribute :server_port, Integer
        attribute :leader, Member
        attribute :followers, Array, default: ->{ Array.new }

        def add_member(member)
          if member.state == State.leader
            self.leader = member
          else
            followers << member
          end
        end
      end
    end
  end
end
