class AddImgToMemeTemplate < ActiveRecord::Migration
  def change
    add_column :meme_templates, :template_img, :string
  end
end
