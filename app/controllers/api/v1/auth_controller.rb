class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: user_login_params[:username])

    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      # byebug
      serialized_friends = @user.friends.map { |friend| FriendSerializer.new(friend) }
      serialized_interactions = @user.interactions.map { |interaction| InteractionSerializer.new(interaction) }
      serialized_important_dates = @user.important_dates.map { |date| ImportantDateSerializer.new(date) }
    
      render json: { user: @user.to_json(user_serializer_options), 
        friends: serialized_friends, 
        interactions: serialized_interactions, 
        important_dates: serialized_important_dates, 
        jwt: token }, status: :accepted
    else  
      render json: { message: 'Invalid username or password' }, status: :unauthorized 
    end

  end

  private
  
  def user_login_params
    params.require(:auth).permit(:username, :password)
  end

  def user_serializer_options
    {
      :except => [:password_digest, :email, :created_at, :updated_at]
    }
  end 

end
