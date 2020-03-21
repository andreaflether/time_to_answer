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
end
