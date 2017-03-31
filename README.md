## A Simple icinga2-client for [resin.io][resin-link]

In this repository you find source files for Icinga2 -client docker image for Resin. I don't go in detail of using Icinga2 or Resin.
If you not familiar with Icinga2 or [resin.io][resin-link], maybe you should check their documentation first to learn the basics.

If you are looking for a docker image for Icinga2 master-node, take a look at Centos based [Official Icinga2 container][icinga2-docker] or if you are a Debian fan like myself check [@jjethwa's docker image][jordan-icinga2]
They, of course, say that these containers are only for demo and testing purposes, but I'm brave (or stupid) enough to use them in production.

This image is semi-automatic, but obviously you need to put some configuration in place. 

You need to manually create an installation ticket for your brand new satellite host. There actually is a way to create the ticket via Icinga2 api, 
but I did have hard time to get Curl play nice with variables. So for now, creating the ticket manually is quite easy workaround.

## Configuration

# Master node

1. Create a pki ticket for you client at your Icinga2 master node (I'm using sputnik for the client name)
```
$ icinga2 pki ticket --cn sputnik
```

2. Create sputnik -configuration at the master node and make child zone of your master -zone.
```
cat <<EOF >/etc/icinga2/conf.d/zones/sputnik.conf
    object Endpoint "sputnik" {
   }
   object Zone "sputnik" {
      endpoints = [ "sputnik" ];
      parent = "master";
   }
EOF
```

# Client

Actually you have no configuration to make on the client side, besides writing you application ResinOS -image to SD-card. 


# Resin

You need to se few variables at the resin site.

Device- level variables
 - client_host
 - icinga_ticket

Application- level variables (for multiple devices)
 - master_host
 - master_ip

That's all configuration you need. Autoconfiguration should do the rest based on these variables.


If you want to clone this repo, simply run:
```
$ git clone git@github.com:jerenius/icinga2-client-resin
```
Then add your resin.io application's remote repository to your local repository:
```
$ git remote add resin username@git.resin.io:username/icinga2-client-resin.git
```
and push the code to the newly added remote:
```
$ git push resin master
```

Sit back and wait for the configuration to complete. My Raspberry Pi 2 -devices using class 10 SD-cards take roughly 10-15 minutes to 
configure Icinga2 -settings once the image is downloaded on the device.


[resin-link]:https://resin.io/
[signup-page]:https://dashboard.resin.io/signup
[gettingStarted-link]:http://docs.resin.io/#/pages/installing/gettingStarted.md
[icinga2-docker]:https://hub.docker.com/r/icinga/icinga2/
[jordan-icinga2]:https://hub.docker.com/r/jordan/icinga2/
[icinga2-site]:[https://www.icinga.com/]

