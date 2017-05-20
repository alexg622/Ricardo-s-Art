class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email 
    	t.string :phone 
    	t.text :bio
    	t.string :username
    	t.string :password_digest

      t.timestamps
    end
  end
end
