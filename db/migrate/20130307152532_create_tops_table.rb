class CreateTopsTable < ActiveRecord::Migration
  def change
    create_table :tops do |t|
      t.datetime :date
      t.string :genre
    end
    create_table :top_tracks do |t|
      t.integer :top_id
      t.integer :track_id
      t.integer :position
    end
  end
end
