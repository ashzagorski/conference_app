class Api::MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    render 'index.json.jbuilder'

    search_term = params[:search]
    if search_term
      @meeints = @meetings.where(remote: true)
    end
  end 

  def create
    @meeting = Meeting.new(
                           title: params[:title],
                           agenda: params[:agenda],
                           string: params[:time],
                           location: params[:location],
                           remote: params[:false]
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
