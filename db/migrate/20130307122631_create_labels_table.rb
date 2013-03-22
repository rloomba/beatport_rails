class CreateLabelsTable < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :id_beatport_label
    end
  end
end
