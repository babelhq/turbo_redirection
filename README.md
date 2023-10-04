# TurboRedirection

This gem contains some reusable modules for Turbo Redirection extracted from our main app. See the detailed description and usage examples in respective modules.

The modules are:

## BreakOutOfFrame

Adds support for breaking out of a Turbo Frame (or targeting a specific frame)
from the server. It does so by responding with a Turbo Stream that will perform the visit.
It will clear the cache for the frame if the request is a POST, PUT, PATCH, or DELETE,
which is similar to how a normal Turbo Drive Form submission works.

## RedirectWithoutTurbo

Adds support for redirecting *and breaking out of Turbo* in response to a
Turbo Streams request. This is useful when you want to redirect to a page that does not
live on the same domain as our app and thus would fail to load in via Turbo.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "turbo_redirection"
```

And then execute:

    $ bundle install

## Usage

Include the module in your controller:

```ruby
class MyController < ApplicationController
  include TurboRedirection
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/babelhq/turbo_redirection.
