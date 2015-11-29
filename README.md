# RubyDig

This gem adds Hash#dig and Array#dig from Ruby 2.3+ to earlier versions of Ruby.  It is a no-op if you are running Ruby 2.3 or greater.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_dig'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_dig

## Usage

```
require 'ruby_dig'

response = {mom: {first: "Marge", last: "Bouvier"},
            dad: {first: "Homer", last: "Simpson"},
            kids: [
                {first: "Bart", last: "Simpson"},
                {first: "Lisa", last: "Simpson"}
            ]}

response.dig(:kids, 1, :first)
# => "Lisa"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruby_dig/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
