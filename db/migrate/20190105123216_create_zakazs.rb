class CreateZakazs < ActiveRecord::Migration[5.1]
  def change
    create_table :zakazs do |t|
      t.string :name
      t.string :phone
      t.string :dish
      t.string :drink
      t.string :adress
      t.integer :user_id

      t.timestamps
    end
  end
end
