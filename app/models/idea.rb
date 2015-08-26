class Idea < ActiveRecord::Base
  enum quality: { swill: 0, plausible: 1, genius: 2 }
  
  validates :title,   presence: true, uniqueness: true
  validates :body,    presence: true
  validates :quality, presence: true
  
  def increase_quality
    if swill?
      1
    elsif plausible?
      2
    else
      quality
    end
  end
  
  def decrease_quality
    if genius?
      1
    elsif plausible?
      0
    else
      quality
    end
  end
end
