class RemoveStockColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :stock, :integer
  end
end
