class Api::SpeakersController < ApplicationController
  
  def index_speakers
    @speakers = Speaker.all
    render 'speaker_index.json.jbuilder'
  end 

  def create_speakers
    @speaker = Speaker.new(
                           first_name: params[:first_name],
                           last_name: params[:last_name],
                           email: params[:email], 
                           gender: params[:gender],
                           age: params[:age],
                           )
    @speaker.save
    render 'speaker_show.json.jbuilder'
  end 

  def show_speakers
    @speaker = Speaker.find(params[:id])
    render 'speaker_show.json.jbuilder'
  end 

  def update_speakers
    @speaker = Speaker.find(params[:id])

    @speaker.first_name = params[:first_name] || @speaker.first_name
    @speaker.last_name = params[:last_name] || @speaker.last_name
    @speaker.email = params[:email] || @speaker.email
    @speaker.gender = params[:gender] || @speaker.gender
    @speaker.age = params[:age] || @speaker.age

    @speaker.save
    render 'speaker_show.json.jbuilder'
  end 

  def destroy_speakers
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    render json: {message: "Speaker successfully destroyed"}
  end 

  def index
    @meetings = Meeting.all
    render 'meetings_index.json.jbuilder'
  end 

  def create
    @meeting = Meeting.new(
                           title: params[:title],
                           agenda: params[:agenda],
                           string: params[:time],
                           location: params[:location],
                           remote: params[:false]
                           )
    meeting.save
    render 'meeting_show.json.jbuilder'
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

    meeting.save
    render 'meeting_show.json.jbuilder'
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    render json: {message: "Meeting successfully destroyed"}
  end 
end
