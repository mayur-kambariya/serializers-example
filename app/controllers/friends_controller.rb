class FriendsController < ApplicationController

  def index
    friends = Friend.all
    render json: friends
  end 

  def create
    friend = Friend.new(friend_params)

    if friend.valid?
      friend.save
      render json: friend 
    else
      render json: { message: 'oop, your friend has to have a name' }
    end

  end

  def show
    friend = Friend.find(params[:id])
    render json: friend
  end 

  def update
    friend = Friend.find(params[:id])
    byebug
    friend.update(friend_params)
    render json: friend
  end 

  def destroy
    friend = Friend.find(params[:id])
    friend.destroy
    render json: friend
  end 

  private

  def friend_params
    params.require(:friend).permit(:name, :user_id, :pronouns, :appreciation, :starred)
  end 

  # FIND THE SERIALIZER IN THE SERIALIZERS FOLDER
  # def friend_serializer_options
  #   :include => {
  #     :bird => {:only => [:name, :species]},
  #     :location => {:only => [:latitude, :longitude]}
  #   }, :except => [:updated_at])

  # end 

end
