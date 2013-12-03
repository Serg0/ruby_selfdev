require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :products
  fixtures :carts

=begin
  test("create card and save") do

    card = carts(:one)

    assert_not_nil card
    assert_not_nil card.id


    product_to_add = products(:ruby)


    #assert_not_nil card.id

    puts "carts(:one) id #{carts(:one).id}"
    puts "carts(:one) ids"
    carts(:one).line_items.each do |item|
      puts item.id
    end

    puts "carts(:two) ids"
    carts(:two).line_items.each do |item|
      puts item.id
    end

    assert_equal 2, card.line_items.size,

                 card.add_product(product_to_add.id, product_to_add.price).save!

    assert_equal 3, card.line_items.size

    card.add_product(product_to_add.id, product_to_add.price).save!

    assert_equal 3, card.line_items.size

    product_to_add.price = 123.99
    card.add_product(product_to_add.id, product_to_add.price).save!

    assert_equal 4, card.line_items.size


    card.add_product(product_to_add.id, product_to_add.price).save!

    assert_equal 4, card.line_items.size


    assert_not_empty card.line_items

    #card.add_product 1 2


  end
=end


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


=begin
  test "assert difference test" do
    puts  "assert difference test"


    test_num = 0

    assert_difference "test_num", 3 do
      puts test_num
      test_num += 3
      puts test_num

      12
    end

    puts test_num
  end
=end

  test "add duplicate products count change" do


    card = carts(:one)
    products = [products(:ruby), products(:ruby2), products(:ruby3)]

    card.line_items.each do |item|
      puts  "item.id=#{item.id} item.id=#{item.product_id} item.quantity=#{item.quantity} item.price=#{item.price}"
    end

    products.each do |product|
      card.add_product(product.id, product.price).save!
      #puts  "item.id=#{item.id} item.id=#{item.product_id} item.quantity=#{item.quantity} item.price=#{item.price}"
    end

    card.line_items.each do |item|
      puts  "item.id=#{item.id} item.id=#{item.product_id} item.quantity=#{item.quantity} item.price=#{item.price}"
    end

    products.each do |product|
     card.add_product(product.id, product.price).save!
      #puts  "item.id=#{item.id} item.id=#{item.product_id} item.quantity=#{item.quantity} item.price=#{item.price}"
    end

    card.line_items.each do |item|
      puts  "item.id=#{item.id} item.id=#{item.product_id} item.quantity=#{item.quantity} item.price=#{item.price}"
    end


    card.line_items.each do |item|
      #puts "=====item.product.id= #{item.product_id}  quantity=#{item.quantity}"
      #puts  "item.id=#{item.id} item.id=#{item.product_id} item.quantity=#{item.quantity} item.price=#{item.price}"
    end



    products.each do |product|
      assert_difference "card.line_items.size", 0  do
        item = card.add_product(product.id, product.price)
        #puts  "item.id=#{item.id} item.id=#{item.product_id} item.quantity=#{item.quantity} item.price=#{item.price}"

        item.save

      end
    end

    puts "card.total_quantity #{card.total_quantity}"
    puts "card.line_items.size #{card.line_items.size}"

  end

=begin
  # @param [line_item] item
  def save_item(item)
    #
  if item.save
    puts "Item saved successfully"
  else
    puts "Item NOT saved successfully"
  end
  end
=end



=begin
  test "add duplicate products price change" do

    card = carts(:one)
    products = [products(:ruby), products(:ruby2), products(:ruby3)]


    products.each do |product|
      card.add_product(product.id, product.price).save!
      card.save!

    end

    products.each do |product|
      assert_difference "card.total_price", product.price do
        card.add_product(product.id, product.price).save!
        card.save!

      end
    end


  end


  test "add diff products price change" do

    card = carts(:one)
    products = [products(:ruby), products(:ruby2), products(:ruby3)]

    products.each do |product|
      assert_difference "card.total_price", product.price do
        card.add_product(product.id, product.price).save!
        card.save!
      end
    end
  end
=end





end
