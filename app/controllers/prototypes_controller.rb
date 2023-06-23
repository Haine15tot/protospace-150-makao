class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    # @comments = @prototype.comments
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

  def edit
    unless @prototypes.user == current_user
      redirect_to root_path
    end
  end
  def update
    if @prototypes.update(prototype_params)
      redirect_to root_path(@prototypes), notice: '投稿が更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @prototypes.user == current_user
      @prototypes.destroy
      redirect_to root_path, notice: '投稿が削除されました'
    else
      redirect_to root_path, notice: '投稿の削除に失敗しました'
    end
  end

  private
  def set_prototype
    @prototypes = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end












