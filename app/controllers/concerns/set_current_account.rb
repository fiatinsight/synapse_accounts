module SetCurrentAccount
  extend ActiveSupport::Concern

  included do
    before_action :current_account
  end

  private

    def current_account
      # Sets a current client based on Current.testing_center or Current.profile

      # NOTE: This should *not* be configured to set Current.client based on URL parameters, since those can be hacked, and since they match for access validation in the profile-level controllers, e.g., SuperController

      if params[:client_token]
        session[:client_token] = params[:client_token]
      end

      if signed_in? && session[:client_token]
        Current.client = Client.find_by(token: session[:client_token])
      elsif Current.testing_center
        Current.client = Client.find(Current.testing_center.client_id)
      elsif Current.profile && Current.profile.client_id
        Current.client = Client.find(Current.profile.client_id)
      else
        Current.client = nil
      end
    end
end
