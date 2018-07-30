#!/bin/sh
#reading user_name variable from user...
read USER_NAME
echo "Hello $USER_NAME"
echo "I will create you a file called ${USER_NAME}_file"
#creating a file with name user_name_file
touch "${USER_NAME}_file"
#going to this directory
cd ../Assignment_2/knife-ec2/
#running this command
knife ec2 server create --help