module SetCurrentTeam
  extend ActiveSupport::Concern

  included do
    before_action :current_team
  end

  private

    def current_team
      if params[:team_token]
        session[:team_token] = params[:team_token]
      end

      if signed_in? && session[:team_token]
        Current.team = eval(SynapseAccounts.configuration.team_model).find_by(token: session[:team_token])
        # Passing a token is the safest and can be easily configured from the main app's ApplicationController after_sign_in_path_for method
      else
        Current.account = nil
      end
    end
end
