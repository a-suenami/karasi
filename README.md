# Karasi

**Karasi** previewable your `rails` application views without controllers implementation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'karasi', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install karasi

## Usage

### config/routes.rb

#### Subdomain access with Rails engine
```
constraints subdomain: 'preview' do
  mount Karasi::Engine, at: '/'
end
```

#### Path access

```
get 'preview/*path', to: 'karasi/karasi#show'
```

### config/karasi.yml

```
hello/index:
  title: Hello world!
  @message: This is example application.
```

### app/views/hello/index.erb

```
<h1><%= title %></h1>
<p><%= @message %></p>
```

And access to `/hello/index` show to the hello messages.

### Use layout

Add `config/karasi.yml` to

```
layout: application
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/karasi.

## TODO

* helpers
