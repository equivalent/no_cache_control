# NoCacheControl

If you're building paranoid software where security must be
bullet-proof, one concern is that Authenticated pages **should
not be browser cached**.

This is due to fact that even when user is logged out, someone
may sit at his competer and click browser back button and see the
restricted data.

Gem will set these headers:

```
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Pragma: no-cache
Expires: -1
```

If you are building next-gen Twitter app than this is a bad idea
because you want to cache as much as possible. But when you're
building comertial Dashboards, payment software, ... than you
must do this.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'no_cache_control'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install no_cache_control

## Usage

* whitelisting of controllers that should be cached

## Contributing

1. Fork it ( https://github.com/[my-github-username]/no_cache_control/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
