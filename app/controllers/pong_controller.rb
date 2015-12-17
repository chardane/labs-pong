class PongController < ApplicationController

  def index
    team = Team.find_by(name: pong_params[:name])

    if pong_params[:event] == "plus"
      team.add_point!
    elsif pong_params[:event] == "minus"
      team.minus_point!
    end

    render json: {name: team.name, score: team.current_score}
  end

  def lametric_scoreboard
    watson = Team.find_by(name: "watson")
    hal = Team.find_by(name: "hal")

    response = {
      "frames": [
        {
          "index": 0,
          "text": "#{watson.current_score} - #{hal.current_score}",
          "icon": "a917"
        }
      ]
    }
    render json: response
  end

  private

  def pong_params
    params.permit(:name, :event)
  end

end
