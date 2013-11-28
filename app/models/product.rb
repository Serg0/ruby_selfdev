class Product < ActiveRecord::Base
  validates :title, :description, :image_url, :price, presence: true
=begin
  validates :title, uniqueness: true , :minimum => 10 message: "Title must be 10 chars long at least"
=end
  validates :title, uniqueness: true , :length => {
      :minimum => 10,
      :message => "Title must be 10 chars long at least"
  }



  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
      multiline: true,
      with:
          %r{\.(gif|jpg|png)$}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
