bundler-github
==============

Use shorthand instead of full Github repository URIs in your `Gemfile`. 

Oh, yes... **syntactic sugars!**

Installation
------------

``` bash
gem install bundler-github
```
**Note:** Currently, this gem must always be installed *after* Bundler. If you update or re-install Bundler, you'll need to re-install this gem. See the caveat below for details.

Usage
-----

In your `Gemfile` you can now replace:

``` ruby
gem 'devise', git: 'https://github.com/plataformatec/devise.git'
```

with:

``` ruby
gem 'devise', github: 'plataformatec/devise'
```

**But wait!** That sugar only gets sweeter! If the repository's name is the same as the gem's name (and it usally is), you can leave out the repo name and just include the repository owner.

``` ruby
gem 'devise', github: 'plataformatec'
```

*How you like them apples!?*

### Other notes on usage ###

* `bundler-github` just expands and swaps the `:github` option out for `:git`, other options, like `:branch`, `:ref`, etc. should be left untouched.
* I may favor the Ruby 1.9 syntaxes in my examples, but the gem does not. It was developed for and tested against 1.8.7 and 1.9.x.
* You should not include `bundler-github` in your `Gemfile`. Bundler is already loaded by the time your application's `Gemfile` is read.

Caveat emptor!
--------------

> *You coveteth my ice cream bar...*

I have no idea if this is going to work for you, in your environment. It's beta-quality software, and as such should not be considered production ready. 

The only way I could find to hook in and add the `:github` option was to make my own `bundle` command which replaces the executable generated by Rubygems in your `$PATH`. The new command includes our patch then loads Bunder's original `bundle` command. For a hack, I think it's pretty elegant.

If you can suggest a better way to hook another gem without needing to modify the original gem or require it somewhere explicitly, I'd love to hear it. The unique way bundler is used makes it challenging to extend without any kind of plugin API.

Copyright
---------

Copyright &copy; 2011 Jason L Perry. See MIT-LICENSE for the rights reserved.