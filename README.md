# Synapse Accounts

## Usage

Create an initializer and set any required config variables:

```ruby
SynapseAccounts.configure do |config|
  config.from_email_address = "email@example.com"
  config.welcome_email_template_id = 17045345
  config.postmark_api_token = Rails.application.credentials.postmark[:api_token]
  config.account_model = "Organization"
end

```

### For authentication

There are a number of model concerns that allow you to do typical things with authentication-enabled classes within your application.

#### CreateAuthenticable
#### Passwordable
#### Welcomeable
#### Profileable
#### Simulateable
#### SetCurrentProfile

### For accounts

#### Accountable
#### SetCurrentAccount

In your main app, include `:account` in the list of `Current` attributes. Also, set `config.model_class` in an initializer. Then in your `ApplicationController` add:

```ruby
include SetCurrentAccount
```

## Development

To build this gem for the first time, run `gem build synapse_accounts.gemspec` from the project folder.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fiatinsight/synapse_accounts.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
