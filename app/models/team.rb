class Team < ActiveRecord::Base
  def add_point!
    self.current_score += 1
    save!
  end

  def minus_point!
    self.current_score -= 1
    save!
  end

  def reset_points!
    self.current_score = 0
    save!
  end
end
