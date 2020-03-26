module Welcomeable
  extend ActiveSupport::Concern

  included do
    after_commit :send_welcome_email, on: :create
  end

  def send_welcome_email
    SynapseAccounts::SendWelcomeEmailJob.set(wait: 5.seconds).perform_later(self)
  end

end
