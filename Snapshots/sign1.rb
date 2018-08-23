require 'aws-sdk'
require 'faraday_middleware/aws_signers_v4'

require 'elasticsearch'
require 'byebug'

# sts = Aws::STS::Client.new(
#   region: 'us-east-1',
#   access_key_id: 'XYZ',
#     secret_access_key: 'XYZ'
#   )


# resp = sts.get_session_token({
#   duration_seconds: 3600, 
#   # serial_number: "YourMFASerialNumber", 
#   # token_code: "123456", 
# })

# credentials = resp.credentials

# puts access_key_id     = credentials.access_key_id     # String
# puts expiration        = credentials.expiration        # Time
# puts secret_access_key = credentials.secret_access_key # String
# puts session_token     = credentials.session_token     # String


# bucket_name = "ashu-s3-bucket"
# # # Get an instance of the S3 interface using the session credentials.
# s3 = Aws::S3::Client.new(credentials: resp.credentials)


# # # Get a list of all object keys in a bucket.
# s3 = Aws::S3::Resource.new(region: 'us-east-1')
# # bucket = s3.bucket("#{bucket_name}").objects.collect(&:key)
# # puts bucket
# resp = s3
# resp.buckets.each do |bucket|
#   puts bucket.name
# end
# byebug

# bucket = s3.bucket(bucket_name)
# count = bucket.objects.count
# puts bucket.exists?
# puts "Items (#{count}):"

  # bucket.objects.each do |obj|
  #   puts "  Name: #{obj.key}"
  # end

# s3.buckets.each do |bucket|
#   puts bucket.name
# end



# signer = Aws::Sigv4::Signer.new(
#   service: 'es',
#   region: 'us-east-1',
#   access_key_id: 'XYZ',
#   secret_access_key: 'XYZ'
# )


# # byebug

# byebug
# signature = signer.sign_request(
#   http_method: 'PUT',
#   url: 'https://search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com',
#   headers: {
#     'x-amz-content-sha256' => 'UNSIGNED-PAYLOAD'
#   }
# )



# # # urls = signer.presign_url(
# # #     http_method: 'PUT',
# # #     url: 'https://search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com/',
# # #     body_digest: 'UNSIGNED-PAYLOAD'
# # #   )




# # byebug
# headers = {}
# headers['host'] = signature.headers['host']
# headers['x-amz-date'] = signature.headers['x-amz-date']
# headers['x-amz-session-token'] = session_token
# headers['x-amz-content-sha256'] = signature.headers['x-amz-content-sha256']
# headers['authorization'] = signature.headers['authorization']



# # byebug

# @elasticsearch_client ||= Elasticsearch::Client.new(
# host: "https://search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com",
# retry_on_failure: 3,
# retry_on_status: [500, 502, 503, 504,443,403],
# reload_on_failure: true,
# transport_options: {
#             headers: headers
# }
# )



# # # @elasticsearch_client = Elasticsearch::Client.new host: 'search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com:8080'


# # # @elasticsearch_client = Elasticsearch::Client.new host: "#{urls}"


# # # @elasticsearch_client = Elasticsearch::Client.new url: "https://search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com"





# # # @elasticsearch_client ||= Elasticsearch::Client.new(
# # # url: "https://search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com#{urls.request_uri}",
# # # retry_on_failure: 3,
# # # retry_on_status: [500, 502, 503, 504],
# # # reload_on_failure: true,
# # # )

# response = @elasticsearch_client.perform_request 'PUT', '/_snapshot/manik-index-backups', {}, {:type => 'S3', :settings => {:bucket => "ashu-s3-bucket", :endpoint => "s3.amazonaws.com", :role_arn => "arn:aws:iam::783945584287:role/ash-role"}},headers

# response = @elasticsearch_client.perform_request 'PUT', '_snapshot/manikes-index-backups', {}, {:type => 'S3', :settings => {:bucket => "ashu-s3-bucket", :endpoint => "s3.amazonaws.com", :role_arn => "arn:aws:iam::783945584287:user/MSYS-CHEF"}}

@elasticsearch_client ||= Elasticsearch::Client.new(
  host: 'https://search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com', port: '443') do |f|
    f.request :aws_signers_v4,
    credentials: Aws::Credentials.new('XYZ', 'XYZ'),
    service_name: 'es',
    region: 'us-east-1'
end

body = {:type=>"s3", :settings=>{:bucket=>"ashu-s3-bucket", :endpoint=>"s3.amazonaws.com", :role_arn=>"arn:aws:iam::783945584287:role/ash-role"}}
response = @elasticsearch_client.snapshot.perform_request('PUT', '_snapshot/manikes-index-backups', {}, body).body

