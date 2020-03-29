module SetCurrentAccount
  extend ActiveSupport::Concern

  included do
    before_action :current_account
  end

  private

    def current_account
      if params[:account_token]
        session[:account_token] = params[:account_token]
      end

      if signed_in? && session[:account_token]
        Current.account = eval(SynapseAccounts.configuration.account_model).find_by(token: session[:account_token])
        # Passing a token is the safest and can be easily configured from the main app's ApplicationController after_sign_in_path_for method
      else
        Current.account = nil
      end
    end
end
