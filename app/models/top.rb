class Top < ActiveRecord::Base
  has_many :top_tracks
  has_many :tracks, :through => :top_tracks
end
