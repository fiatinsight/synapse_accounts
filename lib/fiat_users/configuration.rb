module FiatUsers
  class Configuration
    attr_accessor :postmark_api_token, :from_email_address, :welcome_email_template_id

    def initialize
      @postmark_api_token = nil
      @from_email_address = nil
      @welcome_email_template_id = nil
    end
  end
end
