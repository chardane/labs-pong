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

  private

  def pong_params
    params.permit(:name, :event)
  end

end
