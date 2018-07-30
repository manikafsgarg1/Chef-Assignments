require 'fog/aws'
#creating a ec2 instance using fog gem
ec2 = Fog::Compute.new :provider => 'AWS', :region => 'us-east-1a'

response = ec2.run_instances(
  "ami-66506c1c",
  1,
  1,
  "InstanceType"  => "t1.micro",
  "SecurityGroup" => "ssh",
  "KeyName"       => "ammy"
)

instance_id = response.body["instancesSet"].first["instanceId"]
instance = ec2.servers.get(instance_id)
instance.wait_for { ready? }
puts instance.public_ip_address
