class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototypes = Prototype.new
  end

  def create
    @prototypes = Prototype.new(prototype_params)
    if @prototypes.save
      redirect_to root_path, notice: '投稿されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
