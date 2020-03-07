module Passwordable
  extend ActiveSupport::Concern

  included do
    before_validation :generate_password, on: :create
  end

  def generate_password
    # This can't be in a job b/c before_validation won't allow serializing the request b/c there isn't an ID yet
    if !self.encrypted_password.present?
      password = Devise.friendly_token.first(10)
      self.password = password
      self.password_confirmation = password
    end
  end
end
