class StoreController < ApplicationController
  def index

    @products = Product.order(:title)
    @time = Time.now

    @index_count = index_query_count
  end
end
