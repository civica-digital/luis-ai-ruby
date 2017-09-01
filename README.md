# Luis

This gem will allow you to easily interact with Microsoft's Luis AI NLP engine. It is a simple query interface that provides inference responses in the form of compact objects that are easily used through Ruby.

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
  config.timeout = 10  # Luis query timeout (seconds, optional).
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/civica-digital/luis-ai-ruby.


## License

The gem is available as open source under the terms of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
