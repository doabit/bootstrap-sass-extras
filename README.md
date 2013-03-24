# Bootstrap::Sass::Extras

[bootstrap-sass][1] extras, idea and codes from [twitter-bootstrap-rails][2]

  [1]: https://github.com/thomas-mcdonald/bootstrap-sass
  [2]: https://github.com/seyhunak/twitter-bootstrap-rails

## Installation

Add this line to your application's Gemfile:

    gem 'bootstrap-sass-extras'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap-sass-extras

## Generating layouts and views

You can run following generators to get started with Twitter Bootstrap quickly.


Layout (generates Twitter Bootstrap compatible layout) - (Haml and Slim supported)


Usage:


    rails g bootstrap:layout [LAYOUT_NAME] [*fixed or fluid]


Example of a fixed layout:


    rails g bootstrap:layout application fixed


Example of a responsive layout:


    rails g bootstrap:layout application fluid


Themed (generates Twitter Bootstrap compatible scaffold views.) - (Haml and Slim supported)


Usage:


    rails g bootstrap:themed [RESOURCE_NAME]


Example:


    rails g scaffold Post title:string description:text
    rake db:migrate
    rails g bootstrap:themed Posts

Notice the plural usage of the resource to generate bootstrap:themed.

## Using Helpers

### Flash helper
Add flash helper `<%= bootstrap_flash %>` to your layout (built-in with layout generator)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
