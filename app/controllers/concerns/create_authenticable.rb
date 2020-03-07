module CreateAuthenticable
  extend ActiveSupport::Concern

  def create_authenticable(model_name, email)
    authenticable = model_name.constantize
    @authenticable = authenticable.find_or_create_by(email: email)
  end

  def link_authenticable_to_profile(authenticable, profile_type, profile_id)
    model = profile_type.constantize
    profile = model.find(profile_id)
    profile.update(user_id: user.id)
  end
end
