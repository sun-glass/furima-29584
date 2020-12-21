class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :price
  end
  
  with_options presence: true, numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :prefecture
  end

  belongs_to :user
  #has_one_attached :
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :Status, :delivery_fee, :Prefecture, :shipping_day

end
