class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :verify_password, only: [:update]

  def index
    @admins = Admin.all
  end

  def edit
    
  end
  
  def update 
    if @admin.update(admin_params)
      redirect_to admins_backoffice_admins_path, notice: "Informações atualizadas com sucesso."
    else  
      render 'edit'
    end 
  end 

  def new 
    @admin = Admin.new
  end
  
  def create 
    @admin = Admin.new(admin_params)

    if @admin.save 
      redirect_to admins_backoffice_admins_path, notice: "Administrador cadastrado com sucesso!"
    else
      render 'new' 
    end 
  end 

  def destroy 
    if @admin.destroy 
      redirect_to admins_backoffice_admins_path, notice: "Administrador apagado com sucesso."
    else 
      render 'index' 
    end 
  end 

  def verify_password 
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank? 
      params[:admin].extract!(:password, :password_confirmation)
    end 
  end 

  private 

  def set_admin 
    @admin = Admin.find(params[:id])
  end 

  def admin_params 
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end 
end
