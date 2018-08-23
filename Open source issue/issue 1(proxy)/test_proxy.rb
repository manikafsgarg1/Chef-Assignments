# host = '172.31.82.173'
# require 'net/ssh'
# require 'byebug'

# Net::SSH.start(host, "ubuntu") do |session|
# 	byebug 
#     result = session.exec!("ifconfig")
#     puts result
# end

host = '172.31.82.173'
require 'net/ssh'
require 'net/ssh/proxy/http'
require 'byebug'

proxy_host = '54.226.50.144'
proxy_port = 3128
# byebug
proxy = Net::SSH::Proxy::HTTP.new( proxy_host, proxy_port )
byebug
Net::SSH.start( host, "ubuntu", :proxy => proxy ) do |session|
  result = session.exec!("ifconfig")
    puts result
end