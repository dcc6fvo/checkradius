# checkradius

*A simple Radius checker for Zabbix/Linux*

This is a simple way to test a radius server in the Zabbix or Linux terminal. It has to be used as a "external script" in the Zabbix environment. If the script returns 1 it means you were successfully authenticated, otherwise it returns 0 for a bad authentication. The script can also display the radtest output with a -v parameter.

<img src="https://freeradius.org/img/wordmark.svg?width=32"/>

# Requirements

* radtest (freeradius-utils debian package)
* zabbix-agent (for zabbix usage)


# Usage - Zabbix

**Step 1:**
First of all, it is necessary to install the script inside the "external scripts" of a given zabbix agent. In a Debian 10 install you should find this folder on: **/usr/lib/zabbix/externalscripts**. In this case we will use the zabbix server agent itself.

**Step 1:**
In the next step just copy the **checkradius.sh** from this repository to **/usr/lib/zabbix/externalscripts/checkradius.sh**. Check the file execution permission:

```
$ sudo chmod +x checkradius.sh
```

**Step 3:**
Then we will start the Zabbix configuration. Go to Zabbix Server Web Interface, then Configuration > Hosts > Create Host and create a JMX interface putting the radius server IP and port and save the new host.  

**Step 4:**
The next step we enter in the fresh new host created in step 2, choose Items and "Create Item". Then we change the type of the item to "External check". 
On the "key" field you should do something like (change this example with your need):

```
checkradius.sh["-u felipe.volpato", "-p 123456", "-a 172.16.70.2", "-o 1812",  "-s myradiussecret"]
```

# Usage - Linux

```
./checkradius.sh -u john -p 1234 -a 191.52.0.25 -o 1812 -s myradiussecret

```


