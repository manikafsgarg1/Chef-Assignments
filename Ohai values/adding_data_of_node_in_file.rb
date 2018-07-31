#fetching data from node attributes collected by ohai tool
aws_array = [:hostname,:ipaddress,:platform,:platform_version]
data2 = Array.new

#creating a file and setting its content to be ohai values
file '/etc/chef/file.txt' do
  owner 'login'
  group 'login'
  mode '0755'
  content "Content of aws \n #{data2.join('		\\n 		')}"
  action :create
end

