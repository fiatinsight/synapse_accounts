module Simulatable
  extend ActiveSupport::Concern

  included do
    after_commit -> { FiatUsers::GenerateSimTokenJob.set(wait: 10.seconds).perform_later(self) }, on: :create
  end

end
