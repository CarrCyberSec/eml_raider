#!/bin/bash
#Bash Script that pulls out commonly analyzed email header artifacts
#Author: Brian T. Carr
#Copyright 2019, Brian T. Carr, All rights reserved. 
#Author's Personal Wesbite: briantcarr.com
#Computer Emergency Response Team Intern at the Center for Internet Security
#Any inquiries can be directed to: brian.carr@cisecurity.org
#If you improve upon this script, I encourage you to share your results. 
#42 72 69 61 6e 20 54 68 6f 6d 61 73 20 43 61 72 72 

#Input File
read -p "Enter File name...: " fname 
#Regular Expressions
pattern_ipv4='[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
pattern_email='[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}'
if [ -f $fname ]
then
#Grep statements
	ipv4_results=$(grep -Eio "$pattern_ipv4" "$fname" | sort | uniq -c )
	email_results=$(grep -Eio "$pattern_email" "$fname" | sort | uniq -c )
      	message_id=$(grep -i "Message-ID" "$fname")
	x_originating=$(grep -i "originating" "$fname")
	client_info=$(grep -i "client" "$fname")
	spf_info=$(grep -i "spf" "$fname")
#output 
	echo _____________________________________
	echo The IPv4 Addresses located were: 
	echo "$ipv4_results"
	echo _____________________________________
	echo The Email Addresses located were:
	echo "$email_results"
	echo _____________________________________
	echo The client info located was:
	echo "$client_info"
	echo _____________________________________
	echo The X-originating IP address was:
	echo "$x_originating"
	echo _____________________________________
	echo The Sender Policy Framework infromation was:
	echo "$spf_info"
	echo _____________________________________
	echo The Message-ID was:
	echo "$message_id"
	echo =====================================
	
fi
