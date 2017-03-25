class ChangeStockFromBooleanToInt < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :stock, 'integer USING CAST(stock AS integer)'
  end
end
