class CreateArtistsTable < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :artist_type
      t.integer :id_beatport_artist
    end
    create_table :artists_tracks do |t|
      t.integer :artist_id
      t.integer :track_id
    end
  end
end
