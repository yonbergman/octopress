---
layout: post
title: "Why You Should Use Sass"
date: 2012-05-19 17:20
comments: true
categories: [css, web]
---

Today I want to talk about [Sass](http://sass-lang.com/), why I love it and why you should use it.
Sass is a css preprocessor, meaning it's a file format which you compile to css to be served along side your site.
Sass comes in two syntaxes `.scss` and the older syntax `.sass` also called indented Sass, whenever you hear people talking about Sass they're
probably talking about the newer syntax.
In this post I'll be referring only to the `.scss` syntax.

# Why I love Sass

{% img right /images/posts/use-sass/sass.gif %}
Sass is what CSS should be, it has really good abilities that are really missing in CSS.
After working with Sass for some time you won't understand how css doesn't include them built-in.

The 3 big things that Sass gives you are:
> **Nesting**,
> **Variables** and
> **Mixins**

###Nesting
Nesting is the ability to write your selectors in a nested fashion where you don't have to repeat yourself as you go down the
hierarchy of your style. It makes changing top sections of selectors painless and the css code more DRY and concise.
{% codeblock lang:scss %}
.user {
    color:              blue;
    .avatar {
        width:          50px;
        height:         50px;
        .selector {              // Compiles to .user .avatar .selector {
            position:   absolute;
            left:       0;
        }
    }
}
{% endcodeblock %}

An awesome feature of nesting is the ability to _reference self_ while nesting making pseudo-selectors and modifier class beautiful,
 to reference self inside a nested block you just write `&` while inside a block.
{% codeblock lang:scss %}
.btn{
    color: white;
    background: blue;

    &:hover{             // Compiles to .btn:hover {
        color: grey;
        background: lightblue;
    }

    &.warning{
        background: red;
    }
}
{% endcodeblock %}

The last thing you can do with nesting is _reverse nesting_ - adding a selector before current selector.
This feature is amazing and you can do cool stuff with it like browser specific hack, site theming and much more.
{% codeblock lang:scss %}
.profile{
    .avatar{
        color: blue;

        .friends &{             // Compiles to .friends .profile .avatar {
            color: grey;
        }
    }
}
{% endcodeblock %}

I use this to handle _IE specific hacks_, I just add a class to my `<HTML>` tag with the version of IE in question `class='ie7'` and then inside the code
whenever I need to do a IE specific hack I just use reverse nesting
{% codeblock lang:scss %}
.profile{
    border: 2px solid #ddd;
    .ie7 &{
        padding: 25px;
    }
}
{% endcodeblock %}

##Variables
Variables is a pretty straight forward feature, in Sass you can define variables and use them later.
This helps reduce copy-pasted variables like colors, sizes and strings.
Variables are defined in this syntax `$main-color: #ffeeff;` and can be used just by using them instead of the constants you would normally use.

Sass also supports _basic operations_ on variables like math operations, string operations and even color functions.
_Color functions_ are very cool functions that let you modify colors ever so slightly based on a base color instead of hard coding all the color variations,
you can `lighten` a color by x percent, `opacify` or change `hue` - for a complete list of available functions check the [Sass Reference](http://sass-lang.com/docs/yardoc/Sass/Script/Functions.html)

{% codeblock lang:scss %}
$main-color: #ffeeff;
$link-width: 50px;
a{
    color: $main-color;
    &:hover{
        color: lighten($main-color, 20%);
    }
    img{
        width: $link-width * 2;
    }
}
{% endcodeblock %}

You can also do some very _basic programming_ with Sass stuff like `if` and `for` which are really helpful especially helpful when you add the next thing Sass has to offer - mixins.

##Mixins
{% pullquote %}
Mixins are _'functions'_ that you define and can use across the system, they can be used in different selectors and you can pass in arguments.
There are two different uses for mixins that I find, When you need a function shared across the site in several different contexts or
when you define "private" mixins to help you manage your css and separate responsibilities better.
Mixins let you {" treat your stylesheets as first-class citizens in your code base. "}
{% endpullquote %}

{% codeblock lang:scss %}
@mixin floaty($minimized-by-default, $side: left){
    float: $side;
    width: 300px;
    @if $minimized-by-default {
        overflow: hidden;
        width: 5px;
    }
}

.navigation{
    background: green;
    @include floaty(false);
}
.navigation.secondary{
    background: blue;
    @include floaty(true, right);
}
{% endcodeblock %}

Mixins are priceless when you need to have _cross-browser support_, the time we live in right now has us using these amazing
css tricks which aren't always implemented in all the browser or if they are they're wrapped in browser specific prefix.
You can use mixins to help you use the stuff you want while not having to write all the prefixs every time.
For example instead of writing `-webkit-box-shadow... -moz-box-shadow` you can now just write `@include box-shadow();` and the mixin will
take care of writing all the correct prefixes and if needed - change the parameters to fit each browsers quirks.
But you don't really want to right all these mixins for yourself, this is where **Compass** comes in.

[Compass](http://compass-style.org/) is a Sass library containing many of these helpful mixins for cross browser support and other handy stuff that are very helpful.
It has almost everything you need to build beautiful stylesheets with cross browser support - something that if you tried know
that gets messy very fast.

# Why you need it?
The transition from css to Sass is painless - you don't need to change any old files you already have in your system.
Just rename your files from .css to .scss add a compiler (Compass is one, Rails 3.1+ is another) from then on just start using Sass's abilities whenever you need them.
This is a true smooth transition and probably the reason why the .scss syntax beat the old indented syntax.
With Sass you can easily manage a system of plugins and shared library 'code' between different parts of your site and even
between sites in a way which plain css can never do.

With Sass & Compass you can have better Cross browser support especially if you're planning on using all the new 'CSS3' properties.
{% img right /images/posts/use-sass/remuscat.jpg 150 %}
Even if you're not using new properties Sass gives you workaround for the basic stuff **broken** on IE - stuff like `display: inline-block;`

And most of all, Sass lets you treat your stylesheets as part of your code base, with the respect they deserve and with the power that you need.
__So go start using Sass and enjoy the power!__


## Alternatives
There are some other CSS preprocessors out there. I didn't have the chance to use any of them, but people like to know about alternatives.
[Less](http://lesscss.org/) is the biggest rival to Sass and is mature almost as must as it, [Stylus](http://learnboost.github.com/stylus/) is another alternative albeit a smaller one, there are several others but they are really niche.
If you're looking for a CSS preprocessor you should probably go with eiter __Sass__ or __Less__.

## Some Rails tips
 * If you're using **Rails >= 3.1** and the new asset pipeline you already have the power of Sass built in, just rename you're stylesheets to `.css.scss` and you can start using Sass.
 * You should always try and avoid asset pipeline import command `//require ./avatar.css` - use Sass's `@import` function instead this lets you use mixins and variable you define inside the files your import.
   If you use using asset pipeline's `require` you'll get the file compiled in place which isn't that fun.
 * You can use **Compass**'s mixins inside your asset pipeline application. Just added `gem 'compass-rails'` to your Gemfile under the `:assets` group
   and add the following line to your `application.rb` file
   {% codeblock lang:ruby %}
config.sass.load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
   {% endcodeblock %}
 * If you're using an **older version of Rails** or just didn't migrate to the asset pipeline you can use the compass gem to add support for Sass, Compass will not only give you
   Sass support but will also compile the files for you on the fly or when you want to precompile them all.


Hope this post got you interested in checking Sass out - you've got nothing to lose :)

You should follow me on twitter [@YonBergman](http://twitter.com/yonbergman) and subscribe to my [RSS](http://feeds.feedburner.com/Yon-line)