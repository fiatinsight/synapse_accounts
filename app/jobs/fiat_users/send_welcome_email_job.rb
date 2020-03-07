class FiatUsers::SendWelcomeEmailJob < FiatUsers::ApplicationJob
  queue_as :default

  def perform(user)
    client = Postmark::ApiClient.new(FiatUsers.configuration.postmark_api_token)

    client.deliver_with_template(
    {:from=>FiatUsers.configuration.from_email_address,
     :to=>user.email,
     :template_id=>FiatUsers.configuration.welcome_email_template_id,
     :template_model=>
      { "email"=>user.email,
        "password"=>user.password
      }
    })
  end
end
