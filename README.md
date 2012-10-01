Capistrano tagging
====

Automagically tag your current deployed release with capistrano

Install
----

```bash
$ gem install capistrano-tagging
```

Usage
----

In `deploy.rb`:

```ruby
require 'capistrano/tagging'
```

That's it! You can specify format of tag:

```ruby
set :tagging_format, ':rails_env_:release' # default, also available all of deploy variables
```

Original idea:
---

* [https://github.com/LeipeLeon/capistrano-git-tags](https://github.com/LeipeLeon/capistrano-git-tags)

* [http://wendbaar.nl/blog/2010/04/automagically-tagging-releases-in-github/](http://wendbaar.nl/blog/2010/04/automagically-tagging-releases-in-github/)

* [http://gist.github.com/381852](http://gist.github.com/381852)
