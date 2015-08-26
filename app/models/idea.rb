class Idea < ActiveRecord::Base
  enum quality: %w(swill plausible genius)
  
  validates :title,   presence: true, uniqueness: true
  validates :body,    presence: true
  validates :quality, presence: true
end
