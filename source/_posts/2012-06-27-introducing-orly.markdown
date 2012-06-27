---
layout: post
title: "Introducing 'O RLY?'"
date: 2012-06-27 20:15
comments: true
categories: gem
---

Today I scratched an itch, something that has been bugging me for quite some time now.


{% img right /images/posts/orly/owl.png %}
Sometimes I _pull_ a new version of a project and try to run it only to get an annoying _'Run bundle install...'_ message
or worse an app that starts running but then starts to spazz when you do anything just because no one told you that you needed to run `rake db:migrate`
So I built a small gem to help me exactly with these issues :)

__O RLY?__ or __orly__ for short, is a simple utlitly gem you use to install git-hooks into your git repositories.
Every time you either `git pull` or `git merge` _(pull acutally runs a merge)_ orly goes over the changes and notifies you when there are any commands you need to run.
It's very unobtrusive, it doesn't run any commands for you - I wanted you to be in controler and decide when and if to run them, it just tells you about them.
Check out the code on the [github page](https://github.com/yonbergman/orly)

{% img center /images/posts/orly/orly-example.png %}

## Installation
Installing __orly__ is really easy just run the `gem install` command once
    [sudo] gem install orly

After you installed the gem just go to any git repo that you have and wish to install orly on and run
    orly --install

You can always run `orly --uninstall` to remove the git-hook or `orly -h` to get help about orly.

### Using RVM?
You might need to install the orly gem every gemset before you can install the git-hook

### Secret Easter egg
You can also run `orly -s` or `--speak` and make the orly owl repeat what you say __amazing__ progress :)

## The LOLs
{% img left /images/posts/orly/8e968f563d9.jpg 300 %}
Some of the inspiration for ORLY (especially the installation method) came from another awesome utility gem called [lolcommits](https://github.com/mroth/lolcommits), its a really
fun gem that lets takes a picture of you each time you commit code and adds your commit message as text on the image.
It's really fun to have especially when pairing with an unsuspecting victim. Their installation process was really painless and also uses git-hooks.
If you're using a laptop at work or have a webcam install [lolcommits](https://github.com/mroth/lolcommits) you won't regret it.


## Scratch your own itch
One thing we as programmers need to do more is scratch our own itches - if something in your workflow bothers you, takes too much time,
is too manual. _FIX IT!_ either find a solution or write one.
We have the abilities to write stuff like this to make ourselves happier and our work less crazy.
This isn't my first 'band-aid' and it won't be my last, I enjoy building and sharing stuff like this and will continue to scratch away.
Do it too, don't let those itches become more start finding or building solutions now.
Just make sure you're scratching and not [shaving yacks](http://sethgodin.typepad.com/seths_blog/2005/03/dont_shave_that.html) and go build stuff!



You should follow me on twitter [@YonBergman](http://twitter.com/yonbergman) and subscribe to my [RSS](http://feeds.feedburner.com/Yon-line)