module Locateable # NOTE: `Addressable` conflicts w/ another class
  extend ActiveSupport::Concern

  # Requires validation for :address_line_1, :city, :state, and :zip on model

  included do
    # geocoded_by :full_address_string
    # after_validation :geocode
  end

  def full_address_string
    if self.address_line_2?
      string = "#{self.address_line_1}, #{self.address_line_2}, #{self.city}, #{self.state} #{self.zip}"
    else
      string = "#{self.address_line_1}, #{self.city}, #{self.state} #{self.zip}"
    end

    string
  end

  def full_address_html
    if self.address_line_2?
      string = "#{self.address_line_1}<br>#{self.address_line_2}<br>#{self.city}, #{self.state} #{self.zip}"
    else
      string = "#{self.address_line_1}<br>#{self.city}, #{self.state} #{self.zip}"
    end

    string
  end
end
