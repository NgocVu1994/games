class Admin::GamesController < ApplicationController
  load_and_authorize_resource

  def create
    if @game.save
      flash[:success] = flash_message "created"
      redirect_to admin_games_path
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end
  end

  def update
    if @game.update_attributes game_params
      flash[:success] = flash_message "updated"
      redirect_to admin_games_path
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @game.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:failed] = flash_message "failed"
    end
    redirect_to admin_games_path
  end

  private
  def game_params
    params.require(:game).permit :name, :image, :content, :description
  end
end
