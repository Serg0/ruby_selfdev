require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :products
  fixtures :carts

  test "create card and save" do
  card = carts(:one)

  assert_not_nil card
  assert_not_nil card.id

  product_to_add = products(:ruby)

  assert_equal 2, card.line_items.size,

  card.add_product(product_to_add.id, product_to_add.price)

  assert_equal 3, card.line_items.size

  card.add_product(product_to_add.id, product_to_add.price)

  assert_not_empty card.line_items

  #card.add_product 1 2



  end



end
