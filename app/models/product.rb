class Product < ActiveRecord::Base
  include PgSearch
  belongs_to :brand
  belongs_to :clothing_type
  validates :brand, :uniqueness => {:scope => :clothing_type}
  pg_search_scope :search_by_brand_or_type, :associated_against => {
    :brand => :name,
    :clothing_type => :name
  }

  def self.populate_products
    unless Brand.exists? && ClothingType.exists? && Product.exists?
      ["Gap", "Banana Republic", "Boss", "Hugo Boss", "Taylor", "Rebecca Taylor"].each do |brand|
        Brand.create!(:name => brand)
      end
      ["Denim", "Pants", "Sweaters", "Skirt", "Dresses"].each do |c_type|
        ClothingType.create!(:name => c_type)
      end
      Brand.all.each do |brand|
        ClothingType.all.each do |c_type|
          Product.create!(:brand => brand, :clothing_type => c_type)
        end
      end
    end
  end
end
