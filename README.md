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

### For models

There are a number of model concerns that allow you to do typical things with authentication / account-style classes within your application.

#### Passwordable

This module generates a Devise-friendly password for any model that has `include Passwordable`. It requires fields for `password` and `password_confirmation`.

#### Welcomeable

A model concern for sending a welcome email on record creation. It requires setting configuration variables for `config.from_email_address`, `config.welcome_email_template_id`, and `config.postmark_api_token`.

#### Profileable

> Note: This is only a stub.

#### Simulateable

Generates a simulation token for any model with `include Simulateable`. Requires a `sim_token` field.

### For controllers

The following controller concerns make setting account and authentication information easier within your app.

#### CreateAuthenticable

`CreateAuthenticable` includes two methods: `create_authenticable` and `link_authenticable_to_profile`.

`create_authenticable` allows you to generate a new record for your authentication class(es). It requires arguments for model name and email, and returns an `@authenticable` instance variable. `link_authenticable_to_profile` enables connecting your authentication record to a `Profileable` class. It requires arguments for an authenticable instance, a profile type, and the profile ID.

You can invoke them in tandem from a single controller action, for example:

```ruby
def create_account_for_person
  person = # Set using params, or Person.find(params[:id])
  email = # Set using params
  create_authenticable("User", email)
  link_authenticable_to_profile(@authenticable, "Person", person.id)
end
```

#### SetCurrentProfile

> Note: This is only a stub.

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
