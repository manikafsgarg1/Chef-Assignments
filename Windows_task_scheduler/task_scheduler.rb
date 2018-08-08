#a windows task which will run weekly
windows_task 'chef-client' do
  user 'Administrator'
  password '8(j&YoZPQ?U'
  command 'chef-client'
  run_level :highest
  frequency :weekly
  start_day "02/16/2018"
end
