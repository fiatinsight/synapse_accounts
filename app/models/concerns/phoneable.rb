module Phoneable
  extend ActiveSupport::Concern

  # Requires validation for :phone

  included do
    #code
  end

  def raw_phone_number
    self.phone.gsub(/[^0-9]/, "")
  end
end
