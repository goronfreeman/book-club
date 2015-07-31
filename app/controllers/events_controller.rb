class EventsController < ApplicationController
  before_action :retrieve_event, only: [:show, :edit, :update, :destroy]
  before_action :verify_is_admin, except: [:index, :show]

  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
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
    if @event.update(event_params)
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
    if !user_signed_in? || !current_user.admin?
      redirect_to events_path
      flash[:warning] = "Hey! Don't do dat!"
    end
  end
end
