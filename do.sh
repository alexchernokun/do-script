#!/bin/bash
##
ip=`dig $1 +short | awk '{print $1; exit}'`
ip2=`dig $1 @dns1.web-hosting.com +short`
string=`dig $1 +trace +nodnssec | awk '$5 ~ (/[hosting].com/) {print $5}'`
if [[ $string == *dns1.namecheaphosting.com* ]] || [[ $string == *dns1.web-hosting.com* ]] || [[ $string == *registrar-servers.com* ]];
then
(sleep 2
echo "quit";) | nc $1 26 | awk '$2 ~ ( /.com/ ) { print $2 }';
host=$((sleep 2
echo "quit";) | nc $1 26 | awk '$2 ~ ( /.com/ ) { print $2 }')
ssh wh@$host -p 12789
else
echo "Most likely not hosted with us";
echo "Trying to "host" now";
fi
sleep 2
host $ip || host $ip2 || exit
if [[ $(host $ip) == *web-hosting.com* ]] || [[ $(host $ip) == *registrar-servers.com* ]]
then (sleep 2
echo "quit";) | nc $ip 26 | awk '$2 ~ ( /.com/ ) { print $2 }';
ssh wh@$((sleep 2
echo "quit";) | nc $ip 26 | awk '$2 ~ ( /.com/ ) { print $2 }') -p 12789 -v;
else :
fi
if [[ $(host $ip2) == *web-hosting.com* ]] || [[ $(host $ip2) == *registrar-servers.com* ]]
then (sleep 2
echo "quit";) | nc $ip2 26 | awk '$2 ~ ( /.com/ ) { print $2 }';
ssh wh@$((sleep 2
echo "quit";) | nc $ip2 26 | awk '$2 ~ ( /.com/ ) { print $2 }') -p 12789;
else exit0;
fi
