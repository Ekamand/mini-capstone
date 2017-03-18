class AddedStockChecker < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :stock, :boolean
  end
end
