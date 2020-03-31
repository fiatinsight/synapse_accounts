module Phoneable
  extend ActiveSupport::Concern

  # Requires validation for :phone

  included do
    before_commit :scrub_phone_number
  end

  def scrub_phone_number
    if self.phone
      scrubbed_number = self.phone.gsub(/[^0-9]/, "")
      self.update(phone: scrubbed_number)
    end
  end

  def ensure_length
    # TODO: Add length assurance (10 digits)?
    #code
  end
end
