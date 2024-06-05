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

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dev_toolbar.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
