class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date_start
      t.datetime :date_end
      t.integer :people_count, :default => 1
      t.string :category

      t.timestamps
    end
  end
end
