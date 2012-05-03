---
layout: post
title: "Comparing mobile web frameworks"
date: 2012-05-03 21:25
comments: true
categories: [web, mobile]
publish: false
---

I wanted to share my recent experiences with building mobile web ui's.
I experienced working with three different methods of building mobile ui some of them during my day-time job and some on my weekend hacks.
I'll try to give the pros and cons for each method and framework and let you decide which ones fits your project best.

**TLDR;** Mobile Web frameworks are cool kind of like using Twitter Bootstrap, I'm gonna go with building without a framework for most stuff.

{% img right half /images/posts/comparing-web-ui/twitter.jpg 300 Developing web UI%}

So as I said I got to work with 3 differend methods of building a mobile web ui.
The first one was building a mobile web ui for my weekend project [Makom-tov|http://makom-tov.co.il].
I actually wrote and rewrote the ui for that because I wasn't really happy with the result.
I wrote it in jQtouch and then I rewrote in in jQuery Mobile (once it was out of beta).
The other project was writing a mobile ui for my project at work eBay Go Together, this UI was designed by our awesome
 designer and I wrote it using no framework just regular HTML, CSS and Javascript.


Feedback on each method
----

{% img right pullquote-right /images/posts/comparing-web-ui/makom1.PNG 200 Makom-Tov mobile V1 %}

** jQtouch **

* It's kind of old and isn't updated anymore, but it's not missing any major feature.
* It's a good framework to choose if you need iOS native looking ui out of the box.
* It doesn't customize that well
* I didn't like its methods of describing elements and behaviours.
* Supporting RTL wasn't fund but was ok
* Even if you keep the standard UI it doesn't look boring because its the native UI

{% img right pullquote-right /images/posts/comparing-web-ui/makom2.PNG 200 Makom-Tov mobile V2 %}

** jQuery Mobile **

* Awesome documentiaion
* Nice standard ways to define and elements and behaviours
* Good support for themeing
* Poor support for customizing the UI beyond the themeing
* Did not have a fund time to support RTL
* Default UI is device agnostic which means that it doesn't look native on **any** device
* Supports devices I don't care about at all.
* Even if you theme it, it looks the same. Creating an ecosystem of boring apps - which makes me a sad panda :(

{% img right pullquote-right /images/posts/comparing-web-ui/egt.PNG 200 eBay Go Together %}

** No Framework **

* You can do whatever you want!!!
* Support only the features you need
* You can achieve total customization
* Making it look native take some work
* There are JS and CSS libraries that might do some of the stuff and make it easier
* Need to roll out your own JS to support behaviours that feel native
* Smaller download for user - can minimize the most

What should I use?
-----

First you need to decide on what type of web ui you're looking for.

Go **with a framework** if what you need is

* Building fast and well. (think Twitter bootstrap)
* Standard widgets and behaviours (lists, scrolling, swipes)
* Semi-Native **looking** UI
* Must support many devices

Go **no mobile framework** if your needs are

* **Very** custom UI elements
* Few standard widgets
* Want to reach O(100%) native ui
* Like writing your own web/css/js


