## A Simple icinga2-client for [resin.io][resin-link]

In this repository you find source files for [Icinga2][icinga2-site] -docker image for [resin.io][resin-link].

This image is about the client side of Icinga2. Configuration requires few variables set at the resin -portal.

If you are looking for a docker image for Icinga2 master-node, take a look at [Official Icinga2 container][icinga2-docker] of [@jjethwa's docker image][jordan-icinga2]

## Configuration

1. Create a pki ticket for you client at the master node (I'm using satellite01 for the client name)
```
$ icinga2 pki ticket --cn satellite01
```

2. Create satellite01 -configuration at the master node




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
[icinga2-site]:[https://www.icinga.com/]

