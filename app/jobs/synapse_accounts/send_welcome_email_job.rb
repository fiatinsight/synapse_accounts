class SynapseAccounts::SendWelcomeEmailJob < SynapseAccounts::ApplicationJob
  queue_as :default

  def perform(user)
    client = Postmark::ApiClient.new(SynapseAccounts.configuration.postmark_api_token)

    client.deliver_with_template(
    {:from=>SynapseAccounts.configuration.from_email_address,
     :to=>user.email,
     :template_id=>SynapseAccounts.configuration.welcome_email_template_id,
     :template_model=>
      { "email"=>user.email,
        "password"=>user.password
      }
    })
  end
end
