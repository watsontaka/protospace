class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:delete]
  before_action :set_prototype,      only: [:edit, :show]
  before_action :move_to_index,      only: [:edit,:update]


  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
       render :new, status: :unprocessable_entity
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.save
      redirect_to prototype_path(prototype.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comment.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? == current_user.id
      redirect_to root_path
    end
  end

end
