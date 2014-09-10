class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :title
      t.text :description
      t.integer :views

      t.timestamps
    end
  end
end
