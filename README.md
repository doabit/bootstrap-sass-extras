# Bootstrap::Sass::Extras

[bootstrap-sass][1] extras, idea and codes from [twitter-bootstrap-rails][2]

  [1]: https://github.com/thomas-mcdonald/bootstrap-sass
  [2]: https://github.com/seyhunak/twitter-bootstrap-rails

## Note

From version 0.0.6, only support bootstrap 3. If you want to use bootstrap 2, please use version 0.0.5.

## Installation

Add this line to your application's Gemfile:

    gem 'bootstrap-sass-extras'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap-sass-extras

## Generating locale, layouts and views

You can run following generators to get started with Twitter Bootstrap quickly.

Generate locale


Usage:

```ruby
rails g bootstrap:install
```

Layout (generates Twitter Bootstrap compatible layout) - (Haml and Slim supported)


Usage:

```ruby
rails g bootstrap:layout [LAYOUT_NAME] [*fixed or fluid]
```

Example of a fixed layout:

```ruby
rails g bootstrap:layout application fixed
```

Example of a responsive layout:

```ruby
rails g bootstrap:layout application fluid
```

Themed (generates Twitter Bootstrap compatible scaffold views.) - (Haml and Slim supported)


Usage:

```ruby
rails g bootstrap:themed [RESOURCE_NAME]
```

Example:

```ruby
rails g scaffold Post title:string description:text
rake db:migrate
rails g bootstrap:themed Posts
```

Notice the plural usage of the resource to generate bootstrap:themed.

## Using Helpers

### Viewport Meta Helper
Add the viewport meta helper `<%= viewport_meta_tag %>` to your layout
(built-in with layout generator) to render the required meta tag for Bootstrap:

```html
<meta content="width=device-width,initial-scale=1.0" name="viewport" />
```

You can change the content value by passing a hash as an argument:

```erb
<%= viewport_meta_tag(:maximum_scale => "1.0") %>
```

Renders:

```html
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0" name="viewport" />
```

### Flash helper
Add flash helper `<%= bootstrap_flash %>` to your layout (built-in with layout generator)

### Modal Helper
You can create modals easily using the following example. The header, body, and footer all accept content_tag or plain html.
The href of the button to launch the modal must match the id of the modal dialog.

```erb
<%= modal_toggle 'Modal', dialog: '#modal'%>
<%= modal_dialog :id => "modal",
         :header => { :show_close => true, :title => 'Modal header' },
         :body   => 'This is the body',
         :footer => content_tag(:button, 'Save', :class => 'btn btn-primary')
%>
```

### Breadcrumbs Helpers

*Notice* If your application is using [breadcrumbs-on-rails](https://github.com/weppos/breadcrumbs_on_rails) you will have a namespace collision with the add_breadcrumb method.
You do not need to use these breadcrumb gems since this gem provides the same functionality out of the box without the additional dependency.

```ruby
class ApplicationController
  add_breadcrumb :index, :root_path
end
```

```ruby
class ExamplesController < ApplicationController
  add_breadcrumb :index, :examples_path

  def index
  end

  def show
    @example = Example.find params[:id]
    add_breadcrumb @example.name, example_path(@example)
    add_breadcrumb :show, example_path(@example)
  end
end
```

Finally, add the `<%= render_breadcrumbs %>` helper to your layout.

You can wrap the breadcrumbs in an HTML element by using the block form like this:

```erb
<%= render_breadcrumbs do |breadcrumbs| %>
  <%= content_tag(:div, breadcrumbs, class: "container") %>
<% end %>

# =>
# <div class="container">
#   <ol class="breadcrumb">
#     <li> ... </li>
#     <li class="active"> ... </li>
#   </ol>
# </div>
```

There are also a few interface methods available for working with the internal breadcrumbs hashes. The following methods are available in controllers and views.

```ruby
# Given previously added breadcrumbs:

breadcrumbs?
# => true

breadcrumb_names
# => ["example", "show"]
```

The following method is available to controllers only.

```ruby
clear_breadcrumbs
# => nil
```

### Glyph Helper

```erb
<%= glyph(:star) %>
# => <span class="glyphicon glyphicon-star"></span>

<%= glyph(:star, :paperclip) %>
# => <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-paperclip"></span>
```

### Badge Helper

```erb
<%= badge(2) %>
# => <span class="badge">2</span>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
