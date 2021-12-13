class AddEventRefToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :event, null: false, foreign_key: true
  end
end
