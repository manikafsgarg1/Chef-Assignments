require 'fog/aws'
# require 'byebug'
require 'chef/knife'
require_relative 'connection'

# Module for creating a server
module ServerList
  include Connection
  # List_of_servers
  def list_of_servers
    compute = connecting
    instance_list = compute.servers.all
    print instance_list
    num_instances = instance_list.length
    puts '\n'
    puts 'We have ' + num_instances.to_s + ' servers'
  end
  
  def abc
    puts "working..."
  end
end
