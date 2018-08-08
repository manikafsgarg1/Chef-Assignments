# require 'second/connection'
require_relative 'second/connection'
require_relative 'second/ami_list'
require_relative 'second/server_list'
require 'fog/aws'
# require 'byebug'
# require 'ami_list'
# require 'server_list'

# main class
class Second
  include Connection
  include AmiList
  include ServerList

  @compute = nil
  # @aws_access_key = nil
  # @aws_access_key_id = nil

  def initialize(access_key,access_key_id)
  	@aws_access_key = access_key
  	@aws_access_key_id = access_key_id
  end
end

object = Second.new(ARGV[0],ARGV[1])

# Making an instance
# # byebug
# object.connecting
# object.launch

# # Terminating an instance
# object.connecting
# object.terminate_instance

# # Listing amis
# object.list_of_ami('XYZ', 'XYZ')

#Listing servers
object.list_of_servers
