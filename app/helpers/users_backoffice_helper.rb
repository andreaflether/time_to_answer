module UsersBackofficeHelper
  def image(controller)
    case controller 
      when 'registrations'
        'register'
      when 'sessions'
        'login'
      when 'passwords'
        'password'
    end 
  end 

  def avatar_url 
    avatar = current_user.user_profile.avatar 
    avatar.attached? ? avatar : "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"
  end 
end
