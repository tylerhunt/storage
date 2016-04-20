# Storage

For a while now I've played on and off with various alternative to Rails' Active
Record for web application persistence. I've become increasingly dissatisfied
with AR, but haven't been able to settle on what to use next. I keep coming
back to the idea of just rolling something custom for any given app, which
comes out of a desire to kill off as many dependencies in my apps as I can.

The code here isn't intended for production use, but is indicative of my
current thoughts on how I'd like to see data persistence handled in Ruby.

It's based on a handful of well-known patterns, including primarily the
repository pattern, but also swappable storage back-ends via the adapter
pattern and a simplified version of the data mapper pattern.

The only dependencies currently used are those used for the storage back-end
(e.g. the `sequel` and `sqlite3` gems).

## Inspiration

The following blog posts were influential in the experiments found herein:

  - [Why is your Rails application still coupled to ActiveRecord?][coupled]
  - [Persistence with Repository and Query Patterns][query_patterns]
    (and other articles from [Adam Hawkins’s blog][hawkins])

[coupled]: https://blog.lelonek.me/why-is-your-rails-application-still-coupled-to-activerecord-efe34d657c91#.vilsm8ro6
[query_patterns]: http://hawkins.io/2014/01/pesistence_with_repository_and_query_patterns/
[hawkins]: http://hawkins.io "I'm Adam Hawkins"
