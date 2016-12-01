class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @user = User.find(session[:user_id])
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /username
  def profile
    @user = User.find_by(username: params[:username].downcase)
  end

  # GET /users/new
  def new
    @user = User.new
    # @user.attachments.build
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    params[:username].downcase

    respond_to do |format|
       if @user.save
          session[:user_id] = @user.id

          format.html { redirect_to(@user) }
          format.json { render json: @user, status: :created, location: @user }
       else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
       end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      # params.require(:user).permit(:name, :email, :login)
      params.require(:user).permit( :first_name, :last_name, :email, :password, :username,
                                    :dob, :gender, :language_one, :language_two,
                                    :height, :age, :shirt_size, :dress_size,
                                    :pant_size, :shoe_size, :website, :address,
                                    :city, :state, :zip_code, :phone_number,
                                    :photo_one, :photo_two, :photo_three, :photo_four,
                                    :resume)
    end
end
