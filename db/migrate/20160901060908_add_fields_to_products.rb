class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cost, :decimal, default: 0
    add_column :products, :description, :text, default: 'Enter a product description'
    add_column :products, :state, :string, default: 'instock'
    add_column :products, :quantity, :integer, default: 1
  end
end
