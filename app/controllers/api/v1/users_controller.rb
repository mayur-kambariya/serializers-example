class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def create 
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token( user_id: @user.id )
      render json: { user: @user.to_json(user_serializer_options), jwt: @token }, status: :created
    else 
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def index
    users = User.all 
    render json: users.to_json(user_serializer_options)
  end 

  def profile # GET /api/v1/profile
    serialized_friends = @user.friends.map { |friend| FriendSerializer.new(friend) }
    serialized_interactions = @user.interactions.map { |interaction| InteractionSerializer.new(interaction) }
    serialized_important_dates = @user.important_dates.map { |date| ImportantDateSerializer.new(date) }
    render json: { 
      user: @user.to_json(user_serializer_options), 
      friends: serialized_friends, 
      interactions: serialized_interactions, 
      important_dates: serialized_important_dates }
  end

  # EXPERIMENTING
  # def get_interactions
  #   user = User.find(params[:id])
  #   render json: { interactions: serialized_interactions }
  # end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  # def destroy
  # end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password)
  end
  
  def user_serializer_options
    {
      :include => {
        :friends => { :include => {
          :interactions => { :except => [:created_at, :updated_at] },
          :notes => { :except => [:user_id]},
          :important_dates => { :except => [:created_at, :updated_at] }
        },
          :except => [:created_at, :updated_at]
        }
      }, 
      :except => [:password_digest, :email, :created_at, :updated_at]
    }
  end 

end