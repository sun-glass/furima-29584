class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phon_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :block, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :phon_number, numericality: { only_integer: true }, length: { in: 10..11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phon_number: phon_number, purchase_id: purchase.id)
  end
end
