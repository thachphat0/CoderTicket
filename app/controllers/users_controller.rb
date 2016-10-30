class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:new, :create]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, flash: {success: 'User was successfully created.'} }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { 
          flash[:danger] = @user.errors.full_messages.to_sentence
          render :new
        }
        format.json { render json: @user.errors.full_messages.to_sentence, status: :unprocessable_entity }
      end
    end
  end

  def my_events
    @events = current_user.events
  end

  def publish_event
    if @event = Event.find_by_id(params[:id])
      if @event.ticket_types.blank?
        flash[:danger] = "Please add at least one ticket type for event #{@event.name}"
      else
        @event.is_published = true
        if @event.save
          flash[:success] = 'Published event success.'
        else
          flash[:danger] = @event.errors.full_messages.to_sentence
        end
      end
    else
      flash[:danger] = 'Event does not exist.'
    end
    redirect_to my_events_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end
  end
