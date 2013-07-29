---
layout: post
title: Fun with Turbolinks
date: 2013-07-29 22:20
comments: true
categories: rails turbolinks
---

Recently I finished working on a small weekend project based on an idea I've been rolling with for almost 2 years.  
It's called [__Coffee.Spec__](http://www.coffeespec.com/) and it lets you create stunning coffee infographic posters for your office.

{% img right /images/posts/coffeespec/v1.jpg %}

It all started from this awesome [Oatmeal comic about coffee](http://theoatmeal.com/comics/coffee), during lunch [@shayhdavidson](https://twitter.com/shayhdavidson) said how awesome the coffee infographic is and we started throwing around ideas on having an infographic poster for the office.   
That afternoon I opened photoshop and had the first print version on our fridge. **(Feb 2012)**

A couple of months later **(Jul 2012)** we started working on a website version where you could actually create drinks dynamically in the site and print them. But the idea got too big for it's own good. We started adding more and more features {% img right /images/posts/coffeespec/v2.jpg %} - like requesting coffee to be made for you from a Chrome extension , the request would appear on an iPad hanging in the kitchen waiting for next person there…
Thanks to that experience we had a new graphic direction and we had an updated page to hang on our fridge **(Jan 2013)**

Both these version got relatively good feedback on-line and from people visiting our office.

{% img right /images/posts/coffeespec/v3.jpg %}

That's why while looking for a weekend project to test Rails 4 on this idea came back up. I scaled it back down to just creating and printing posters and started working on it.

This was my first experience with Rails 4.0 and more specifically Turbolinks and it was AWESOME.

Also now **(Jul 2013)** we have the **Best** coffee infographic for our office hanging on our fridge, and the awesomest part is that you can have one too by visiting [http://coffeespec.com](http://www.coffeespec.com/)



## Why I like Turbolinks

The last few big projects and weekend projects that I've worked on have included some sort of Javascript MV* framework, and as much as I like working with [Backbone Marionette](http://marionettejs.com/) - nothing beats just writing plain old HTML.

I admit that when I first heard about Turbolink I was sceptical, but after playing around with it and building two website with it already - it's really cool.

The thing I love most about Turbolinks is that even though your site isn't faster at all, it feels **SOOO** much faster.  
Even as a developer the perceived speed of the site is blazing fast. 
I'm not sure if it's the slick transition, 
the lack of jitter or what, but sites with Turbolinks are silky smooth.


{% img right /images/posts/coffeespec/work.jpg %}

## Working with Turbolinks
Opening a new Rails 4 project, Turbolinks is just there waiting to work and that's cool. I have two take aways about customizing sites with Turbolinks.

The first is about adding javascript code.
### Turbolinks & Javascript
Getting Turbolinks and Javascript to play nicely together isn't an issue.
I'm kind of worried about maintaining large projects and avoiding jQuery spaghetti hell, but this isn't really new to Rails.
But having said that adding a few dynamic stuff here and there is a non issue.

I used this little template in every new JS file I worked on to make sure I keep my code clean and run the JS only when I needed to.

```  coffeescript
class MyDynamicView
	@ready: ->
		new MyDnaymicView($el: $(".my-dynamic-view"))
		
$(document).on 'ready', MyDynamicView.ready
$(document).on 'page:load', MyDynamicView.ready
```

This little template lets my encapsulate behaviour inside a Javascript class, run it every time the page runs and still have nice code :) 


The second thing I played around with is dynamic server side forms.
### Dynamic Forms
In Coffee.Spec one of the main usability points is to be able to see the end result of your drink while you build it. 
In the old version we added Ember.js (which was actually known then as Amber.js) and we had to duplicate some code from the server side renderer to the client side which defines what types of drinks there are, which drink has which aspects and so on. *It wasn't fun.*

This time I started out very naively. 
I had my server side rendering the drinks according to the drink type and aspects, and rendering the specific type of form based on the drink type.

Once I started adding more drink types I realized that I need to filter the different aspects based on the drink type. (It doesn't really make sense to add Soy milk to your Coke)  
And I wanted to be able to update the image preview of the coffee - which itself is a DOM element rendered in the server.

**Turbolinks & Some javascript to the rescue!**

I read that Turbolinks has an option to be triggered programmatically.

And added this little piece of code*

```  coffeescript

onInputChange: ->
	location = document.location.href.replace('/\?.+/','')
	location += '?'
	location += @form.serialize()
	Turbolinks.visit(location)	

```

The idea is that each time you change the preview I'll actually replace the page behind you - with an updated page that includes the current preview and the correct form inputs.

It also required a tiny change in the server, so that objects will update attributes dynamically but won't be saved prematurely while previewing.

``` ruby
if params.include? :drink
   @preview = true
   @drink.assign_attributes(drink_params)
end
```

*The actually code is a bit more complex and handles remembering where your focus was and other small stuff

## Summary

Building small websites and weekend projects with Rails 4 and Turbolinks is really fun, you get a product that feels fast even though it has little to no custom JS written.

I'll try to post again about Turbolinks once I have some experience with them on larger projects.

You can check out the [Coffee.Spec repo @ GitHub](https://github.com/yonbergman/coffee-spec)

----

Don't forget to follow me on twitter [@YonBergman](http://twitter.com/yonbergman) and subscribe to my [RSS](http://feeds.feedburner.com/Yon-line).  
Also listen to my new Podcast about mobile development - [Mobile & Beer
](http://mobileandbeer.com/) (Hebrew).