class FiatUsers::GeneratePasswordJob < FiatUsers::ApplicationJob
  queue_as :default

  def perform(user)
    password = Devise.friendly_token.first(10)
    self.update(password: password, password_confirmation: password)
  end
end
