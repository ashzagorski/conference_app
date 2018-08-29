class Api::SpeakersController < ApplicationController
  def speaker_action
    @speaker = Speaker.find_by(id: rand(1..3))
    render 'speaker_view.json.jbuilder'
  end 

end
