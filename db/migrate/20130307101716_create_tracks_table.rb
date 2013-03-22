class CreateTracksTable < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :sku
      t.string :name
      t.string :track_number
      t.string :mix_name
      t.string :title
      t.string :slug
      t.datetime :release_date
      t.datetime :publish_date
      t.string :sample_url
      t.string :rtmp_stream_url
      t.string :preview_mp3_http
      t.string :preview_mp3_rtmp
      t.string :preview_mp4_http
      t.string :preview_mp4_rtmp
      t.string :length
      t.integer :bpm
      t.string :image_main
      t.string :image_waveform
      t.integer :position
      t.integer :beatport_track_id
      t.datetime :retrieval_date
      t.integer :id_beatport_genre
      t.integer :label_id
    end
  end
end
