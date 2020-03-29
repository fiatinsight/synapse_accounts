module SetCurrentProfile
  extend ActiveSupport::Concern

  included do
    before_action :current_profile
    before_action :current_profile_path
    before_action :redirect_root_path
  end

  private

    def current_profile
      #code
    end

    def current_profile_path
      #code
    end

    def redirect_root_path
      #code
    end
end
