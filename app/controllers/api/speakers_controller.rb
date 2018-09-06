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
    if @speaker.save
      render 'speaker_show.json.jbuilder'
    else
      render json: {errors: @speaker.errors.full_messages}, status: :unprocessable_entity
    end 
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

    if @speaker.save
      render 'speaker_show.json.jbuilder'
    else
      render json: {errors: @speaker.errors.full_messages}, status: :unprocessable_entity
    end
  end 

  def destroy_speakers
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    render json: {message: "Speaker successfully destroyed"}
  end 
end
