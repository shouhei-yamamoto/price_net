class RemovePriceFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :price, :integer
  end
end
