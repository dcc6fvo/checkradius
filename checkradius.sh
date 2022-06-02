#!/bin/bash

Usage()
{ 
	echo "Simple usage: ./checkradius -u felipe -p 1234 -a 172.16.70.1 -o 1812 -s mysecret" 
}

Help()
{
	echo "Simple check of a radius server. Could be used with zabbix-agent."
	echo
	echo "Syntax: checkradius [-h|u|p|a|o|s|v]"
	echo "options:"
	echo "u     User"
	echo "p     User password"
	echo "a     IP Address of the Radius Server"
	echo "o			Port of the Radius Server"
	echo "s			Radius Server secret"
	echo "v     Verbose mode"
	echo ""
}

Check()
{

radtest -t mschap -x $1 $2 $3 $4 $5 &> /dev/null

if [ $? == 0 ]; then
	echo 1
	exit 1
else
	echo 0
	exit 0
fi

}

CheckVerbose()
{	
	radtest -t mschap -x $1 $2 $3 $4 $5 
}

v=false

while getopts ":h:u:p:a:o:s:v" option; do
	case $option in
  	
		h)
		Help
    exit;;

		u)
    u=${OPTARG}
    ;;

		p)
    p=${OPTARG}
    ;;

		a)
		a=${OPTARG}
		;;

		o)
		o=${OPTARG}
		;;

		s)
		s=${OPTARG}
		;;

		v)
		v=true
		;;

	  *)
    Usage
    ;;	

	esac
done

shift $((OPTIND-1))

if [ -z "${u}" ] && [ -z "${p}" ] && [ -z "${a}"] && [ -z "${o}" ] && [ -z "${s}" ] ; then
	Usage
fi

if [ "$v" = true ]
  then
		CheckVerbose $u $p $a $o $s     
  else 
		Check $u $p $a $o $s     
fi

