class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :content
      t.string :address
      t.string :phone
      t.string :time_d
      t.string :price
      t.string :image
      t.timestamps null: false
    end
  end
end
