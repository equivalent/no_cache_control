# NoCacheControl

If you're building paranoid software where security must be
bullet-proof, one concern is that Authenticated pages **should
not be browser cached**.

This is due to fact that even when user is logged out, someone
may sit at users computer and click browser back button and see the
restricted data.

Gem will set these headers:

```
Cache-Control: no-cache, no-store, max-age=0, must-revalidate
Pragma: no-cache
Expires: -1
```

If you are building next-gen Twitter app then this is a bad idea
because you want to cache as much as possible. But when you're
building comertial dashboard, payment software, ... then you
should set those headers.

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

Gem will append these headers to all your controllers, you don't need to do anything else.

### whitelisting controllers that should be cached

```ruby
class MyCachableController < ActionController::Base
  skip_before_filter :set_no_cache_control  # rails 3 
  skip_before_action :set_no_cache_control  # rails 4
end
```

Now when I render `MyCachableController` the headers will be default Rails headers

## How to test if it works 

No tests for this project as this is deep integration thing. (If anyone want to write a test
I'm more than happy to merge it in :blush: )

The only way how you can test it is to lunch your Rails server and: 

* open browser, go to the website, and view page headers (like with 
  [web developer tools plugin](http://chrispederick.com/work/web-developer/); then
  click in toolbar Information > View Response header)
* `curl http://0.0.0.0:3000/ -v`

## Tested Versions

Gem should work potentionally on any application that uses `ActionController`
(meaning all Rails versions) but we've tested only these: 

* works on Rails 4.1.x 
* works on Rails 3.2.x (only under Production env, more info [here](https://github.com/equivalent/no_cache_control/issues/1) and [here](http://stackoverflow.com/questions/26994714/how-to-force-cache-control-to-no-store-in-rails-3-2-20)

Please update this README file if you confirm any other



## Contributing

1. Fork it ( https://github.com/[my-github-username]/no_cache_control/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
