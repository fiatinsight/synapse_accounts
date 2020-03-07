$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "fiat_users/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fiat_users"
  s.version     = FiatUsers::VERSION
  s.authors     = ["Andrew Haines"]
  s.email       = ["andrew@fiatinsight.com"]
  s.summary       = "Fiat Insight handling for user accounts"
  s.description   = "This gem is designed to be used by Fiat Insight developers on Rails projects that need to allow user-based authentication"
  s.homepage      = "https://github.com/fiatinsight/fiat_users"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"
  s.add_dependency "devise"
  s.add_dependency "duo_web"
  s.add_dependency "postmark-rails"
  s.add_dependency "sidekiq"

  # s.add_development_dependency "mysql2"
  s.add_development_dependency "sqlite3"
end
