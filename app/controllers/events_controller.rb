class EventsController < ApplicationController
  before_action :verify_is_admin, except: [:index, :show]
  before_action :retrieve_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = 'Your event has been created.'
      redirect_to events_path
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
    if @event.update(post_params)
      flash[:success] = 'Your event has been updated.'
      redirect_to events_path
    else
      flash[:alert] = 'Something went wrong!'
      render :edit
    end
  end

  def destroy
    if @event.destroy
      flash[:success] = 'Your event has been deleted.'
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :presenter, :date)
  end

  def retrieve_event
    @event = Event.find(params[:id])
  end

  def verify_is_admin
    (!user_signed_in?) ? redirect_to(events_path) : (redirect_to(events_path) unless current_user.admin?)
  end
end
