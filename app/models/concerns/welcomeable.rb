module Welcomeable
  extend ActiveSupport::Concern

  included do
    after_commit -> { FiatUsers::SendWelcomeEmailJob.set(wait: 5.seconds).perform_later(self) }, on: :create
  end

end
