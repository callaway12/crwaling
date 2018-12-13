class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :content
      t.string :image
      t.timestamps null: false
    end
  end
end
