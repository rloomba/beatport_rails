require 'beatport'
GENRE_ARRAY = [17,18,1,15,7]

GENRE_ARRAY.each do |genre_id|
  genre = Beatport::Catalog::Genre.find(genre_id)
  top_10 = genre.top_downloads


  @top = Top.create(
      :date   => DateTime.now.to_date,
      :genre  => genre_id
    )
  top_10.each do |track|

    @new_label = Label.find_or_create_by_name(
      :name => track.label.name,
      :id_beatport_label => track.label.id
      ) 
    @new_track = Track.find_or_create_by_name(
      :sku => track.sku,
      :name => track.name,
      :track_number => track.track_number,
      :mix_name => track.mix_name,
      :title => track.title,
      :slug => track.slug,
      :release_date => track.release_date.to_datetime,
      :publish_date => track.publish_date.to_datetime,
      :sample_url => track.sample_url,
      :rtmp_stream_url => track.rtmp_stream_url,
      :preview_mp3_http => track.preview['mp3']['http'],
      :preview_mp3_rtmp => track.preview['mp3']['rtmp'],
      :preview_mp4_http => track.preview['mp4']['http'],
      :preview_mp4_rtmp => track.preview['mp4']['rtmp'],
      :length => track.length,
      :bpm => track.bpm,
      :image_main => track.dynamic_images['main']['url'],
      # :image_waveform => track.dynamic_images['waveform']['url'],
      :beatport_track_id => track.id,
      :retrieval_date => DateTime.now.to_date,
      :id_beatport_genre => 17,
      :label_id => @new_label.id
      )
    track.artists.each do |artist|
      new_artist = Artist.create(
        :name => artist.name,
        :artist_type => artist.type,
        :id_beatport_artist => artist.id
        )
      @new_track.artists << new_artist
    end

      TopTrack.create(
      :top_id => @top.id,
      :track_id => @new_track.id,
      :position => track.position,
      )
      
  end
end

