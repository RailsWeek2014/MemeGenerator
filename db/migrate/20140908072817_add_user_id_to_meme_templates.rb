class AddUserIdToMemeTemplates < ActiveRecord::Migration
  def change
    add_column :meme_templates, :user_id, :integer
  end
end
