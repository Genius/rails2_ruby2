# Rails2Ruby2

A collection of monkey-patches to make Rails 2 work on Ruby 2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails2_ruby2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails2_ruby2

## Usage

If you are using this gem in conjunction with the [Genius rails2 fork]('https://github.com/Genius/rails2') include the following line in your Gemfile: 

```ruby
gem "rails2_ruby2", "~>1.0"
```

If you are not using the Genius rails2 fork but are instead using something like [rails 2.3 lts](https://github.com/makandra/rails/tree/2-3-lts) you will need to add `rails2_ruby2` to your Gemfile as specified above and manually include the patches by component, e.g.:

```ruby
require "rails2_ruby2/action_mailer"

require "rails2_ruby2/action_pack"

require "rails2_ruby2/action_view"

require "rails2_ruby2/active_model"

require "rails2_ruby2/active_record"

require "rails2_ruby2/active_resource"

require "rails2_ruby2/active_support"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rails2_ruby2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
