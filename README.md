# DevToolbar

First Draft DevToolbar for `appdev-projects` beginner ergonomics in Rails applications.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem "dev_toolbar"
end
```

Then execute:

```bash
bundle install
```

Then, add a configuration file with the names and routes you want links for:

```rb
# config/initializers/dev_toolbar.rb

if Rails.env.development?
  DevToolbar.configure do |config|
    config.links = [
      { name: "Routes", path: "/rails/info/routes" },
      { name: "Database", path: "/rails/db" }, # rails_db gem must be installed
      { name: "ERD", path: "/erd" }, # to display this, the erd.png must be in the public/ folder
      # etc.
    ]
  end
end
```

These routes will now appear on every page in your app while in development.

## Updating the gem

1. Pull request and make changes
2. [Test locally](https://gist.github.com/jonathanroehm/70749fb6f29c61d0af7c7ed9cc233f79)
2. Bump `lib/dev_toolbar/version.rb`
3. `gem build dev_toolbar.gemspec`
4. `gem push dev_toolbar-X.X.X.gem`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/firstdraft/dev_toolbar.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
