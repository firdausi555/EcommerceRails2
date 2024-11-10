class AddDefaultQuantityToProducts < ActiveRecord::Migration[7.2]
  def change
    change_column_default :products, :quantity, 2
  end
end
