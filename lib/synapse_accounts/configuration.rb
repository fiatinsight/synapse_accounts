module SynapseAccounts
  class Configuration
    attr_accessor :postmark_api_token, :from_email_address, :welcome_email_template_id, :account_model

    def initialize
      @postmark_api_token = nil
      @from_email_address = nil
      @welcome_email_template_id = nil
      @account_model = nil
    end
  end
end
