#fetching data from node attributes collected by ohai tool
aws_array = [:hostname,:ipaddress,:platform,:platform_version]
data2 = Array.new
aws_array.each do |key|
	data2.push(node[key])
end
