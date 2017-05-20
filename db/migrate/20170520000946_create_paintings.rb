class CreatePaintings < ActiveRecord::Migration[5.0]
  def change
    create_table :paintings do |t|  
    	t.string :name_of_painting
    	t.string :price 
    	t.text :description 
      t.integer :artist_id


      t.timestamps
    end
  end
end
