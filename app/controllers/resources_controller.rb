class ResourcesController < ApplicationController
  before_action :retrieve_resource, only: [:show, :edit, :update, :destroy]
  before_action :verify_is_admin, except: [:index, :show]

  def index
    @resources = Resource.all
  end

  def new
    @resource = current_user.resources.build
  end

  def create
    @resource = current_user.resources.build(resource_params)

    if @resource.save
      flash[:success] = 'Your resource has been created.'
      redirect_to resources_path
    else
      flash[:alert] = 'Something went wrong!'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      flash[:success] = 'Your resource has been updated.'
      redirect_to resources_path
    else
      flash[:alert] = 'Something went wrong!'
      render :edit
    end
  end

  def destroy
    if @resource.destroy
      flash[:success] = 'Your resource has been deleted.'
      redirect_to resources_path
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:description, :category, :url)
  end

  def retrieve_resource
    @resource = Resource.find(params[:id])
  end

  def verify_is_admin
    if !user_signed_in? || !current_user.admin?
      redirect_to events_path
      flash[:warning] = "Hey! Don't do dat!"
    end
  end
end
