# DevToolbar

First Draft DevToolbar for `appdev-projects` beginner ergonomics in Rails applications.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem "dev_toolbar", git: "https://github.com/firstdraft/dev_toolbar.git", branch: "bp-make-it-work"
end
```

Then execute:

```bash
bundle install
```

Then, add a configuration file with the names and routes you want links for:

```rb
# config/initializers/dev_toolbar.rb
DevToolbar.configure do |config|
  config.links = [
    { name: "Routes", path: "/rails/info/routes" },
    { name: "Database", path: "/rails/db" },
    # etc.
  ]
end
```

Finally, include the `dev_toolbar` helper in your layout file, e.g.:

```html
<!-- app/views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
  <head>
    <!-- ... -->
  </head>
  <body>
    <%= dev_toolbar %>
    <%= yield %>
  </body>
</html>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/firstdraft/dev_toolbar.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
