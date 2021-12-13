class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :address
      t.string :checkout
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
