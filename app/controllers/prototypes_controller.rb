class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @comments = @prototype.comments
    @comment = Comment.new
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: '投稿されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end

  def update
    if @prototype.user == current_user
      if @prototype.update(prototype_params)
        redirect_to prototype_path(@prototype), notice: '投稿が更新されました'
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path, alert: '編集権限がありません'
    end
  end

  def destroy
    if @prototype.user == current_user
      @prototype.destroy
      redirect_to root_path, notice: '投稿が削除されました'
    else
      redirect_to root_path, alert: '削除権限がありません'
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
