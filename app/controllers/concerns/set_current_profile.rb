module SetCurrentProfile
  extend ActiveSupport::Concern

  included do
    before_action :current_profile
    before_action :current_profile_path
    before_action :redirect_root_path
  end

  private

    def current_profile
      unless current_admin
        # Sets a current profile per user based on all available profiles for that user

        if params[:profile_token]
          session[:profile_token] = params[:profile_token]
        end

        if signed_in? && session[:profile_token]
          # Assumes a principal should be the first option
          if current_user.principal && Principal.where(token: session[:profile_token], user_id: current_user.id).any?
            Current.profile = Principal.find_by(token: session[:profile_token])
          elsif current_user.teacher && Teacher.where(token: session[:profile_token], user_id: current_user.id).any?
            Current.profile = Teacher.find_by(token: session[:profile_token])
          elsif current_user.proctor && Proctor.where(token: session[:profile_token], user_id: current_user.id).any?
            Current.profile = Proctor.find_by(token: session[:profile_token])
          elsif current_user.testing_center_administrator && TestingCenterAdministrator.where(token: session[:profile_token], user_id: current_user.id).any?
            Current.profile = current_user.testing_center_administrator
          elsif current_student
            Current.profile = current_student
          # elsif for all other profile types
          end
        elsif current_user && current_user.principal
          Current.profile = current_user.principal
        elsif current_user && current_user.teacher
          Current.profile = current_user.teacher
        elsif current_user && current_user.proctor
          Current.profile = current_user.proctor
        elsif current_student
          Current.profile = current_student
        else
          Current.profile = nil
        end
      end
    end

    def current_profile_path
      unless current_admin
        if Current.profile
          if Current.profile.model_name == "Principal"
            Current.profile_path = "principal_principal_path"
          elsif Current.profile.model_name == "Teacher"
            Current.profile_path = "teacher_teacher_path"
          elsif Current.profile.model_name == "Proctor"
            Current.profile_path = "proctor_proctor_path"
          elsif Current.profile.model_name == "TestingCenterAdministrator"
            Current.profile_path = "center_admin_testing_center_administrator_path"
          elsif Current.profile.model_name == "Student"
            Current.profile_path = "account_student_path"
          end
        else
          Current.profile_path = nil
        end
      end
    end

    def redirect_root_path
      # TODO: This should ideally check for root_path, but current_page? isn't an available method in a controller
      if current_profile_path && controller_name == 'pages'
        redirect_to send(Current.profile_path, Current.profile)
      end
    end
end
