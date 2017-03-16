# Luis

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/luis`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'luis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luis

## Usage

### Configuration

The Luis endpoint URL must be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem.

In order to get the endpoint URL you can go to the _Publish App_ section for your Luis AI application and copy the URL listed under _Endpoint url_.

```ruby
Luis.configure do |config|
  config.endpoint_url = ''
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/luis.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
