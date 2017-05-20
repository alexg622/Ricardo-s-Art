class AddAvatarToPaintings < ActiveRecord::Migration[5.0]
  def change
    add_column :paintings, :avatar, :string
  end
end
