require 'faraday_middleware/aws_signers_v4'
# require 'aws-sdk'
require 'elasticsearch' 
require 'byebug'
# require 'patron'

@elasticsearch_client ||= Elasticsearch::Client.new(
  host: 'PATH-TO-HOST', port: '443') do |f|
    f.request :aws_signers_v4,
    credentials: Aws::Credentials.new('ACCESS-KEY', 'SECRET-ACCESS-KEY'),
    service_name: 'SERVICE-NAME',
    region: 'REGION'
end

# creating repository
@elasticsearch_client.snapshot.create_repository repository: "manikes-index-backups",
body: {
  type: "s3",
  settings: { bucket: "ashu-s3-bucket", endpoint: "s3.amazonaws.com", role_arn: "arn:aws:iam::xxx:role/ash-role"}
}

# creating snapshot
# byebug
@elasticsearch_client.snapshot.create repository: 'manikes-index-backups',
                           snapshot: 'snapshots-9'

#deleting snapshot
# byebug
@elasticsearch_client.snapshot.delete repository: 'manikes-index-backups',
                           snapshot: 'snapshots-9'

#deleting repository
# byebug
@elasticsearch_client.snapshot.delete_repository repository: 'manikes-index-backups'



# # Verifing Snapshot
puts @elasticsearch_client.snapshot.verify_repository repository: 'manikes-index-backups'

# # Getting Snapshot
# byebug
puts @elasticsearch_client.snapshot.get repository: 'manikes-index-backups',
                           snapshot: 'snapshots-9'

# #Getting Repository
puts @elasticsearch_client.snapshot.get_repository repository: 'manikes-index-backups'
