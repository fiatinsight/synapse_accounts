module Passwordable
  extend ActiveSupport::Concern

  included do
    after_commit :generate_password, on: :create
  end

  def generate_password
    # Should be in a job
    if !self.encrypted_password.present?
      password = Devise.friendly_token.first(10)
      self.update(password: password, password_confirmation: password)
    end
  end
end
