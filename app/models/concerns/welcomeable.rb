module Welcomeable
  extend ActiveSupport::Concern

  included do
    after_commit :send_welcome_email, on: :create
  end

  def send_welcome_email
    # Should be in a job
    client = Postmark::ApiClient.new(FiatUsers.configuration.postmark_api_token)

    client.deliver_with_template(
    {:from=>FiatUsers.configuration.from_email_address,
     :to=>self.email,
     :template_id=>FiatUsers.configuration.welcome_email_template_id,
     :template_model=>
      {"action_url"=>"https://arktest.org/account/secret/new?email=#{self.email}",
       "login_url"=>"https://arktest.org/account/login",
       "email"=>self.email,
       "password"=>self.password,
       "support_email"=>"help@arktest.org"}}
    )
  end
end
