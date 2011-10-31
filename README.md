Capistrano tagging
====

Automagically tag your current deployed release with capistrano

Install
----

    gem install capistrano-tagging

Usage
----

in deploy.rb:

    require 'capistrano/tagging'

    set :tag_format, ':rails_env_:release' # by default, also available all of deploy variables

Original idea:
---

* [https://github.com/LeipeLeon/capistrano-git-tags](https://github.com/LeipeLeon/capistrano-git-tags)

* [http://wendbaar.nl/blog/2010/04/automagically-tagging-releases-in-github/](http://wendbaar.nl/blog/2010/04/automagically-tagging-releases-in-github/)

* [http://gist.github.com/381852](http://gist.github.com/381852)
