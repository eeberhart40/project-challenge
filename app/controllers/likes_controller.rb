class LikesController < ApplicationController
    before_action :find_dog

    def create
        if own_dog?
            flash[:notice] = "Your dog rocks! But sorry, you can't like it"
        elsif already_liked?
            flash[:notice] = "We know you love dogs but you can't like one more than once!"
        else
            @dog.likes.create(user_id: current_user.id)
        end
        redirect_to dog_path(@dog)
    end

    private

    def find_dog 
        @dog = Dog.find(params[:dog_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, dog_id: params[:dog_id]).exists?
    end

    def own_dog?
        @dog.owner.id === current_user.id
    end
end
