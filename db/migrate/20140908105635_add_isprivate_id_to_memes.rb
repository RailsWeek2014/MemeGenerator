class AddIsprivateIdToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :isprivate, :boolean
  end
end
