require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :products
  fixtures :carts

  test "add diff products count change" do

    card = carts(:one)
    products = [products(:ruby), products(:ruby2), products(:ruby3)]

    products.each do |product|
      assert_difference "card.line_items.size", 1 do
        card.add_product(product.id, product.price).save!
        card.save!
      end
    end

  end

  test "add duplicate products count change" do

    card = carts(:one)
    products = [products(:ruby), products(:ruby2), products(:ruby3)]

    3.times  do |index|
      products.each do |product|
        card.add_product(product.id, product.price).save
      end
      card.reload
      assert_equal (index+1)*3, card.total_quantity
    end

    card.line_items.each do |item|
      assert_equal 3, item.quantity
    end

    total_quantity = 0
    card.line_items.each do |item|
      assert_equal 3, item.quantity
      total_quantity +=  item.quantity
    end

    assert_equal total_quantity, card.total_quantity


    products.each do |product|
      assert_difference "card.line_items.size", 0  do
       card.add_product(product.id, product.price).save
      end
    end

  end


  test "add duplicate products price change" do

    card2 = carts(:two)
    products = [products(:ruby), products(:ruby2), products(:ruby3)]


    products.each do |product|
      card2.add_product(product.id, product.price).save!
      card2.save!

    end

    card2.reload

    products.each do |product|
      assert_difference "card2.total_price", product.price do
        card2.add_product(product.id, product.price).save!
        card2.reload
      end
    end


  end


  test "add diff products price change" do

    card = carts(:one)
    products = [products(:ruby), products(:ruby2), products(:ruby3)]

    products.each do |product|
      assert_difference "card.total_price", product.price do
        card.add_product(product.id, product.price).save!
      end
    end
  end





end
