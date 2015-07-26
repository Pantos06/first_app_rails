class UsersController < ApplicationController
	before_filter :authenticate, :only => [:index, :edit, :update]
  	before_filter :correct_user, :only => [:edit, :update]


  def index
  	@titre = "Tous les utilisateurs"
  	@users = User.paginate(:page => params[:page])		
  end	

  def show
  	@user = User.find(params[:id])
  	@titre = @user.nom
  end

  def new
  	@user = User.new
  	@titre = "Inscription"
  end

  def create
  	@user = User.new(user_params)#params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] = "Bienvenue dans l'Application Exemple"
  		redirect_to @user
  	else
  		@titre = "Sign up"
  		render 'new'
  	end	
  end

  def edit
  	@user = User.find(params[:id])
  	@titre = "Edition profil"
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)#params[:user])
  		flash[:success] = "profil actualisé."
  		redirect_to @user
  	else
  		@titre = "Edition profil"
  		render 'edit'
  	end
  end

  private 

  def user_params
  	params.require(:user).permit(:nom, :email, :password, :salt, :encrypted_password)
  end

  def authenticate
  	deny_access unless signed_in?
  end

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_path) unless correct_user?(@user)
  end

end
