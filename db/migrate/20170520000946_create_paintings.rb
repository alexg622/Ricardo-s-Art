class CreatePaintings < ActiveRecord::Migration[5.0]
  def change
    create_table :paintings do |t|
    	t.string :artist
    	t.string :artist_email
    	t.string :artist_phone_number  
    	t.string :name_of_painting
    	t.integer :price 
    	t.text :description 


      t.timestamps
    end
  end
end
