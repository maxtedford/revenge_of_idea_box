class Idea < ActiveRecord::Base
  enum quality: %w(swill plausible genius)
  
  validates title,   presence: true
  validates body,    presence: true
  validates quality, presence: true
end