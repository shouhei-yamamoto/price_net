class CreateProductUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :product_urls do |t|
      t.text :price_url
      t.belongs_to :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
