class Api::MeetingsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    search_term = params[:search]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    @meetings = Meeting.all

   

  
    if search_term
      @meetings = @meetings.where("name iLIKE ?", "%#{search_term}")
    end

     if sort_order && sort_attribute
      @meetings = @meetings.order(sort_attribute => sort_order)
    elsif sort_attribute
      @meetings = @meetings.order(sort_attribute)
    end 

     render 'index.json.jbuilder'
  end 

  def create
    @meeting = Meeting.new(
                           title: params[:title],
                           agenda: params[:agenda],
                           string: params[:time],
                           location: params[:location],
                           remote: params[:false],
                           speaker_id: params[:speaker_id]
                           )
    if @meeting.save
      render 'meeting_show.json.jbuilder'
    else
      render json: {errors: @meeting.errors.full_messages}, status: :unprocessable_entity
    end
  end 

  def show
    @meeting = Meeting.find(params[:id])
    render 'meeting_show.json.jbuilder'
  end 

  def update
    @meeting = Meeting.find(params[:id])

    @meeting.title = params[:meeting] || @meeting.title
    @meeting.agenda = params[:agenda] || @meeting.agenda
    @meeting.time = params[:time] || @meeting.time
    @meeting.location = params[:location] || @meeting.location
    @meeting.remote = params[:remote] || @meeting.remote
    @meeting.speaker_id = params[:speaker_id] || @speaker_id

    if @meeting.save
      render 'meeting_show.json.jbuilder'
    else 
      render json: {errors: @meeting.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    render json: {message: "Meeting successfully destroyed"}
  end 
end
