## A Simple icinga2-client for Resin

This is a simple Icinga-client container to be used with [resin.io][resin-link].

You need an Icinga2 -master node to make use of this image.

I do not provide an image for the master node and you need to figure this out
on your own. If you found your way here, you probably have Icinga2 master running.
If you are looking Icinga2 master running in a Docker -container, I suggest you
take a look at the [Icinga2 demo container][icinga2-docker] or Jordan Jethwas [Icinga2 container][jordan-icinga2].

There are few steps to get going with this image. 

1. Create an account in Resin, create one [here][signup-page] and review [gettingStarted-link]:http://docs.resin.io/#/pages/installing/gettingStarted.md
   I won't be going in detail about Resin

2. Create an application in Resin (ie. myicinga2) and install ResinOS image to you device of choise (I use Raspberry Pi)

3. Create variables in Resin application for Icinga2 -client autoconfiguration.

Device- level variables
 - client_host
 - icinga_ticket

I didn't yet figure how to use Icinga2 Api for requesting ticket with a script in side container, this is my
workaround to use a Resin-variable.

Application- level variables (for multiple devices)
 - master_host
 - master_ip


If you want to clone this repo, simply run:
```
$ git clone git@github.com:jerenius/icinga2-client-resin
```
Then add your resin.io application's remote repository to your local repository:
```
$ git remote add resin username@git.resin.io:username/myicinga2.git
```
and push the code to the newly added remote:
```
$ git push resin master
```

[resin-link]:https://resin.io/
[signup-page]:https://dashboard.resin.io/signup
[gettingStarted-link]:http://docs.resin.io/#/pages/installing/gettingStarted.md
[icinga2-docker]:https://hub.docker.com/r/icinga/icinga2/
[jordan-icinga2]:https://hub.docker.com/r/jordan/icinga2/
