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

### Example Response

```
cache: [GET /luis/v2.0/apps/44b043b7-9b3a-4759-9174-0b2f4a66045f?subscription-key=3b302a809da846bd87f107db2efe47bd&timezoneOffset=0&verbose=true&q=Como%20sacar%20un%20acta%20de%20nacimiento] miss
=> #<Luis::Result:0x000026e8858900
 @composite_entities=[],
 @entities=
  [#<Luis::Entity:0x000026e88589c8
    @end_index=3,
    @name="como",
    @score=0.9627124,
    @start_index=0,
    @type=:question>,
   #<Luis::Entity:0x000026e88589a0
    @end_index=9,
    @name="sacar",
    @score=0.998077,
    @start_index=5,
    @type=:verb>,
   #<Luis::Entity:0x000026e8858978
    @end_index=31,
    @name="acta de nacimiento",
    @score=0.9600747,
    @start_index=14,
    @type=:subject>],
 @intents=
  [#<Luis::Intent:0x000026e8858db0 @name="howto", @score=0.8623287>,
   #<Luis::Intent:0x000026e8858c98 @name="amend", @score=0.0500230826>,
   #<Luis::Intent:0x000026e8858c70 @name="cost", @score=0.0362653472>,
   #<Luis::Intent:0x000026e8858c20 @name="greeting", @score=0.0344840921>,
   #<Luis::Intent:0x000026e8858bf8 @name="schedule", @score=0.027911773>,
   #<Luis::Intent:0x000026e8858ba8 @name="where", @score=0.027329471>,
   #<Luis::Intent:0x000026e8858b80 @name="input", @score=0.0270639714>,
   #<Luis::Intent:0x000026e8858b58 @name="contact", @score=0.016433619>,
   #<Luis::Intent:0x000026e8858b30 @name="failed-contact", @score=0.00889490452>,
   #<Luis::Intent:0x000026e8858b08 @name="None", @score=0.007859318>,
   #<Luis::Intent:0x000026e8858ab8 @name="flow", @score=0.006125225>,
   #<Luis::Intent:0x000026e8858a90 @name="question", @score=0.0059696096>,
   #<Luis::Intent:0x000026e8858a68 @name="report", @score=0.003323447>,
   #<Luis::Intent:0x000026e8858a40 @name="date", @score=0.00193842372>,
   #<Luis::Intent:0x000026e8858a18 @name="thanks", @score=0.00185025937>],
 @query="Como sacar un acta de nacimiento">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/civica-digital/luis-ai-ruby.


## License

The gem is available as open source under the terms of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
