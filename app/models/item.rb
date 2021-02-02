class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  with_options presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 } do
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one :purchase
end
