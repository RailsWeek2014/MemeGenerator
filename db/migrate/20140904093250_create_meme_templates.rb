class CreateMemeTemplates < ActiveRecord::Migration
  def change
    create_table :meme_templates do |t|
      t.string :title
      t.boolean :isprivate

      t.timestamps
    end
  end
end
