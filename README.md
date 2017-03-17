## A Simple icinga2-client for Resin

This is a simple Icinga-client container to be used with [resin.io][resin-link].

You need an Icinga2 -master node to make use of this image.

I do not provide an image for the master node and you need to figure this out
on your own. If you found your way here, you probably have Icinga2 master running.
If you are looking Icinga2 master running in a Docker -container, I suggest you
take a look at the Icinga2 demo container. 








If you want to clone this repo, simply run:
```
$ git clone git@github.com:jerenius/icinga2-client-resin
```
Then add your resin.io application's remote repository to your local repository:
```
$ git remote add resin username@git.resin.io:username/myapp.git
```
and push the code to the newly added remote:
```
$ git push resin master
```

[resin-link]:https://resin.io/
[signup-page]:https://dashboard.resin.io/signup
[gettingStarted-link]:http://docs.resin.io/#/pages/installing/gettingStarted.md
