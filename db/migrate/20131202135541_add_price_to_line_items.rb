class AddPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal

    LineItem.all.each do |line_item|
        line_item.update_attribute :price,   line_item.product.price
      end

  end

end
