class Track < ActiveRecord::Base
  has_many :top_tracks
  has_and_belongs_to_many :artists
  belongs_to :label
  has_many :tops, :through => :top_tracks
end
