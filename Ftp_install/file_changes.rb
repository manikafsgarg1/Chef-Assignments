#including other cookbook to use attribute
include_recipe 'ohai_attributes::default'

#changing file mode owner and group name
file 'vsftpd.conf' do
  group                      'login'
  mode                       '0555'
  owner                      'login'
  path                       '/etc/vsftpd.conf'
end
#fetching attribute value from different cookbook
data = node['ohai_attributes']['data2']

#creating file and setting content from different cookbook
file '/etc/chef/file2.txt' do
  owner 'login'
  group 'login'
  mode '0755'
  content "Content of aws \n #{data.join('		\\n 		')}"
  action :create
end
