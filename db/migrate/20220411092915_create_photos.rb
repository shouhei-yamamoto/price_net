class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text :image
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
