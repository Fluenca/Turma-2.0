class CreateTravelDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :travel_details do |t|
      t.string :type
      t.string :bookin_nr
      t.date :time
      t.references :events, null: false, foreign_key: true

      t.timestamps
    end
  end
end
