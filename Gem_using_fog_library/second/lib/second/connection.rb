require 'fog/aws'
require 'byebug'

# Making a connection
module Connection
  # Connecting to ec2 services...
  def connecting
    # byebug
    @compute = Fog::Compute.new(:provider => 'AWS',
                                :aws_access_key_id => "#{@aws_access_key_id}",
                                :aws_secret_access_key => "#{@aws_access_key}")
    # byebug
    # instance_id = 'i-0996563f3fcd09b04'
    # a = ['sg-cc59a985','sg-db22d292', 'sg-fa4dea8c']
    # # a = ['sg-cc59a985']
    # # hashh = {'InstanceInitiatedShutdownBehavior.Value' => 'terminate'}
    # hashh = {'GroupId' => a}
    # hashh = {'SourceDestCheck.Value' => 'true', 'GroupId' => a}
    # hashh = {'SourceDestCheck.Value' => 'true'}
    @compute.modify_instance_attribute(instance_id, hashh)
  end


# FOG-COMMAND.....................
# modify-instance-attribute --instance-id i-1234567890abcdef0 --instance-type "{\"Value\": \"m1.small\"}"






  # Launching an instance...
  def launch
    byebug
    response = @compute.servers.create(:tags => { :Name => 'Manik123' },
                                       :flavor_id => 't1.micro',
                                       :security_group_ids => 'xa-xaas',
                                       :key_name => 'manik',
                                       :image_id => 'ami-66506c1c')
    response.wait_for { ready? }
  end

  # Terminating an instance
  def terminate_instance
    instance = @compute.servers.get('i-0104bf48e06f1d79e')
    instance.destroy
    puts 'Terminated'
  end
end

# Launches the specified number of instances using an AMI
# response = @compute.run_instances(
#   "ami-66506c1c",
#   1,
#   1,
#   {"InstanceType"  => "t1.micro",
#     "SecurityGroupId" => "sg-25501e52",
#     "KeyName"       => "manik",
#     # "Tags" => {:Key => "Name", :Value => "manik_test_2"}
#   }
# )
# Creates an instance id
# instance_id = response.body["instancesSet"].first["instanceId"]
# Creates an instance
# instance = @compute.servers.get(instance_id)   # Used to retreive a server
