module Simulateable
  extend ActiveSupport::Concern

  included do
    after_commit :generate_sim_token, on: :create
  end

  def generate_sim_token
    SynapseAccounts::GenerateSimTokenJob.set(wait: 10.seconds).perform_later(self)
  end

end
