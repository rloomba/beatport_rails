class StaticPagesController < ApplicationController
  def index
    @tops = Top.all
    # @tops = Top.where('date = ?', DateTime.now.to_date)
    puts "Name: #{get_genre_name(7)}"
    puts "tops: #{@tops.inspect}"
  end

  helper_method :find_top_tracks

  def find_top_tracks(top)
    @top_tracks = top.top_tracks.order("position")
    @top_tracks.map { |top_track| Track.find(top_track.track_id) }
  end

  helper_method :get_genre_name

  def get_genre_name(genre_id)
    genre_lookup_hash = {17 => "Electro House", 18 => "Dubstep", 1 => "Drum and Bass", 15 => "Progressive House", 7 => "Trance"}
    genre_id.class == String ? genre_lookup_hash[genre_id.to_i] : genre_lookup_hash[genre_id]
  end
end
