module EventStore
  module Clustering
    module Controls
      module GossipEndpoint
        module Response
          def self.instance_id(member_id=nil)
            member_id ||= 1

            UUID.example member_id
          end

          def self.epoch_id
            UUID.example 11
          end

          def self.epoch_number
            1111
          end

          def self.ip_address(member_id=nil)
            IPAddress.example member_id
          end

          def self.leader_ip_address
            IPAddress::Leader.example
          end

          def self.last_commit_position
            111
          end

          def self.writer_checkpoint
            110
          end

          def self.chaser_checkpoint
            109
          end

          def self.epoch_position
            108
          end

          module Time
            def self.example
              Controls::Time.example
            end
          end

          module JSON
            def self.text
              <<-JSON
{
  "members": [
    {
      "instanceId": "#{Response.instance_id 1}",
      "timeStamp": "#{Time.example}",
      "state": "Slave",
      "isAlive": true,
      "internalTcpIp": "#{Response.ip_address 1}",
      "internalTcpPort": 1112,
      "internalSecureTcpPort": 0,
      "externalTcpIp": "#{Response.ip_address 1}",
      "externalTcpPort": 1113,
      "externalSecureTcpPort": 0,
      "internalHttpIp": "#{Response.ip_address 1}",
      "internalHttpPort": 2112,
      "externalHttpIp": "#{Response.ip_address 1}",
      "externalHttpPort": 2113,
      "lastCommitPosition": #{Response.last_commit_position},
      "writerCheckpoint": #{Response.writer_checkpoint},
      "chaserCheckpoint": #{Response.chaser_checkpoint},
      "epochPosition": #{Response.epoch_position},
      "epochNumber": #{Response.epoch_number},
      "epochId": "#{Response.epoch_id}",
      "nodePriority": 0
    },
    {
      "instanceId": "#{Response.instance_id 2}",
      "timeStamp": "#{Time.example}",
      "state": "Master",
      "isAlive": true,
      "internalTcpIp": "#{Response.ip_address 2}",
      "internalTcpPort": 1112,
      "internalSecureTcpPort": 0,
      "externalTcpIp": "#{Response.ip_address 2}",
      "externalTcpPort": 1113,
      "externalSecureTcpPort": 0,
      "internalHttpIp": "#{Response.ip_address 2}",
      "internalHttpPort": 2112,
      "externalHttpIp": "#{Response.ip_address 2}",
      "externalHttpPort": 2113,
      "lastCommitPosition": #{Response.last_commit_position},
      "writerCheckpoint": #{Response.writer_checkpoint},
      "chaserCheckpoint": #{Response.chaser_checkpoint},
      "epochPosition": #{Response.epoch_position},
      "epochNumber": #{Response.epoch_number},
      "epochId": "#{Response.epoch_id}",
      "nodePriority": 0
    },
    {
      "instanceId": "#{Response.instance_id 3}",
      "timeStamp": "#{Time.example}",
      "state": "Slave",
      "isAlive": true,
      "internalTcpIp": "#{Response.ip_address 3}",
      "internalTcpPort": 1112,
      "internalSecureTcpPort": 0,
      "externalTcpIp": "#{Response.ip_address 3}",
      "externalTcpPort": 1113,
      "externalSecureTcpPort": 0,
      "internalHttpIp": "#{Response.ip_address 3}",
      "internalHttpPort": 2112,
      "externalHttpIp": "#{Response.ip_address 3}",
      "externalHttpPort": 2113,
      "lastCommitPosition": #{Response.last_commit_position},
      "writerCheckpoint": #{Response.writer_checkpoint},
      "chaserCheckpoint": #{Response.chaser_checkpoint},
      "epochPosition": #{Response.epoch_position},
      "epochNumber": #{Response.epoch_number},
      "epochId": "#{Response.epoch_id}",
      "nodePriority": 0
    }
  ],
  "serverIp": "#{Response.ip_address 1}",
  "serverPort": 2112
}
              JSON
            end

            module Time
              def self.example
                Controls::Time::Raw.example.iso8601 6
              end
            end
          end
        end
      end
    end
  end
end
