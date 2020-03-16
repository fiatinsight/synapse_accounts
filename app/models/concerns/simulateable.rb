module Simulateable
  extend ActiveSupport::Concern

  included do
    after_commit -> { SynapseAccounts::GenerateSimTokenJob.set(wait: 10.seconds).perform_later(self) }, on: :create
  end

end
