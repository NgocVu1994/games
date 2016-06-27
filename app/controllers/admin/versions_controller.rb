class Admin::VersionsController < ApplicationController
  load_and_authorize_resource

  def create
    if @version.save
      flash[:success] = flash_message "created"
      redirect_to admin_versions_path
    else
      flash[:failed] = flash_message "not_created"
      render :new
    end
  end

  def update
    if @version.update_attributes game_params
      flash[:success] = flash_message "updated"
      redirect_to admin_versions_path
    else
      flash[:failed] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if @version.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:failed] = flash_message "failed"
    end
    redirect_to admin_versions_path
  end

  private
  def game_params
    params.require(:version).permit :name, :description
  end
end
