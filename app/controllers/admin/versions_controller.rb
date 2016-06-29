class Admin::VersionsController < ApplicationController
  load_and_authorize_resource
  load_and_authorize_resource :game
  def create
    if @version.save
      flash[:success] = flash_message "created"
      redirect_to admin_game_path(@game)
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end
  end

  def update
    if @version.update_attributes version_params
      flash[:success] = flash_message "updated"
      redirect_to admin_game_path(@game)
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @version.destroy
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  private
  def version_params
    params.require(:version).permit :name, :description, :game_id
  end
end
