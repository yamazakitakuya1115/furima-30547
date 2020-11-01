class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :kind_id, null: false
      t.text :message
      t.references :user
      t.references :item
      t.timestamps
    end
  end
end