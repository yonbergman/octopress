---
layout: post
title: "Writing an Alfred extension with Ruby"
date: 2012-11-04 23:50
comments: true
categories: sideproject, alfred
---

*Another month another side project.*

**TL;DR** - I created an Alfred extension in Ruby, it's easy you can fork my base to create your own.  
If you just want the Spotify finder extension [download it](https://github.com/yonbergman/alfred_spotify_finder/raw/master/Spotify%20Finder.alfredextension)

I love [Alfred](http://www.alfredapp.com/),  
It's a great tool - I use it for tons of different stuff: Running programs, controlling my music, basic math and as a file manager.
A couple of months back we wrote a small extension at work that talks to **Flobot** our bot that manages the TVs in the dev rooms so you can command it from Alfred. It was a nice experience but I didn't get the chance to do anything else since then.

Yesterday someone approached me at work and asked me if there's a way to control the Spotify player from Alfred. I showed him the extension that's hosted on the Alfred site. He thanked me, but then asked if theres a way to actually play a specific song - I liked that idea and couldn't find any extension that does, **So I wrote one.**

I knew that what I wanted to build was a simple extension that receives a track name in the Alfred query and just plays or queues it into your Spotify app, simple.

` play [track name] `

I started by checking the [Spotify API](https://developer.spotify.com/technologies/web-api/) and quickly found that they have a really nice API for searching for tracks and that it responds with something called a Spotify URI which is a unique identifier for a track, album or artist ALA **spotify:track:6ZWn1MVUaBH2HNQobhMYeE**

I went on to see what ways I have to control the Spotify player, I found that it supports some very basic commands in *AppleScript* and that one of those commands is a play command that receives a spotify URL and plays it.  
**COOLNESS.**  
There was also something called **Libspotify** but it was a lot more complex to set up and wouldn't be relavent in an Alfred extension.

So after testing both *API's* seperatly I started working on integrating them. I checked if there was an easy way to send a http request from the AppleScript so I could just query Spotify from the same script that controls the player I couldn't find an easy way to so I decided to try and write the script in **Ruby**.

I wrote a small Ruby script that takes a search query as the program argument, send a http request to the Spotify API and parses the first track URL from it. I then found the supported command to run an AppleScript from the command line and using Tempfiles integrated both parts.  
I now had a script that searched for a query, got the URI, created a temporary AppleScript that when run using the `osascript` command plays the track that was found.

**Success!**

The only thing left was to package it into an Alfred extension. 

{% img center /images/posts/alfred-ruby/extension.png %}

I wanted my extension installation to be as simple as possible, Alfred extension are always really easy double-click installs and I didn't want the fact that I used Ruby to make it any worse.

I found a cool extension that also ran Ruby - the [conversion extension ](http://texasexpat.net/2011/10/convert-for-alfred) script and decided I liked the way they got around this issue - They created a temporary ruby file with the contents of the script, ran it and then removed it.

So I started working on a shell script that unloads my script into a tmp ruby file, runs it and deletes it.
To make that shell script I wrote a third ruby script `wrap.rb` that will help me in development - what it does is take a ruby script and create a shell script from that that when run reopens the ruby file and etc.
I started writing code that read a Ruby script and tries to compress it into a single line without quotes until I figured out I'm heading towards the wrong solution.
I found that I can use a HEREDOC to write a multiline string into a file in the shell :)

{% codeblock %}
> cat FILENAME <<EOF
  this  
  is   
  SPARTA!  
  EOF  
{% endcodeblock %}

So my wrapper script is real simple, it just reads the content of the original script `run.rb` and wraps it in 5 lines of shell that create a tmp file, dump the content into the tmp file, run it using `/usr/bin/env ruby $filename` and then delete it - that's it.

To "**build**" the extension all I have to do is run the `wrap.rb` file it converts the `run.rb` file into an `extension.sh` file which I use to create an Alfred extension.

The only caveat is that I assume Ruby installed on the system which is builtin in the latest OSXs and I don't rely on installed gems.

### In summary

The script is easily replaceable and I can use this system to write more Ruby Alfred extension - and you can to. **Just check out the [GitHub repo](https://github.com/yonbergman/alfred_spotify_finder)**.


You can [download the extension](https://github.com/yonbergman/alfred_spotify_finder/raw/master/Spotify%20Finder.alfredextension) or  
Read the Readme and fork the code on [GitHub](https://github.com/yonbergman/alfred_spotify_finder)


You should follow me on twitter [@YonBergman](http://twitter.com/yonbergman) and subscribe to my [RSS](http://feeds.feedburner.com/Yon-line)

---
PS.
10 Bonus points if you checked what song I embeded earlier when talking about the Spotify API