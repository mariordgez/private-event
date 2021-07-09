module ApplicationHelper
  def signed_in_only
    controller.redirect_to new_user_session_path unless user_signed_in?
   end
   def sign_in_out
    if user_signed_in?
      link_to 'Sign Out', destroy_user_session_path, method: :delete
    else
      link_to 'Sign In', new_user_session_path
    end
  end
end
