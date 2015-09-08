#should-i-update
Takes a friendly look your Gemfile and reports any out of date gems.

    $ should-i-update
    
    Your Gemfile could do with some updating :(
    timers (newest 4.1.1, installed 4.0.1)


## How does it work ?

Under the covers, it's using `bundle outdated`, but then looking at the newest and installed versions to work out if there is a big enough difference to prompt for an update.


## Installation

Add this line to your application's Gemfile:

    gem 'should-i-update'


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install should-i-update

## Usage

    $ should-i-update

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/coder36/should-i-update.

