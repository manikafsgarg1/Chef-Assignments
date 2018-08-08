require 'fog/aws'
# require 'byebug'
require 'chef/knife'
require_relative 'connection'

# List of AMI
module AmiList
  include Connection
  # List of amis
  def list_of_ami
    server_list = ['AMI ID', 'Size', 'Image Location'].flatten.compact
    owner = 'self'
    servers = connecting.describe_images({'Owner'=>'#{owner}'})
    servers.body['imagesSet'].each do |server|
      server_list += get_server_lists(server)
    end
    puts server_list
  end

  # Get the list
  def get_server_lists(server)
    server_list = []
    server_list << server['imageId']
    server_list << server['blockDeviceMapping'].first['volumeSize'].to_s
    server_list << server['imageLocation']
  end
end
