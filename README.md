## A Simple icinga2-client for Resin

This is a simple [resin.io][resin-link] -based icinga2-client running in Docker-container

This project is not useful unless you have a Icinga2 master -node running in your network.

The image is still in development and there's no autoconfiguration yet, and I'm working on it.

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
It should take a few minutes for the code to push. While you wait, lets enable device URLs so we can see the server outside of our local network. This option can be found in the `Actions` tab in your device dashboard.

[resin-link]:https://resin.io/
[signup-page]:https://dashboard.resin.io/signup
[gettingStarted-link]:http://docs.resin.io/#/pages/installing/gettingStarted.md
