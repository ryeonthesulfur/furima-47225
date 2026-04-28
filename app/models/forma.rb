class Forma
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1 }
    validates :city, presence: true
    validates :address, presence: true
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :token, presence: true
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    order.create_address(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                         building: building, phone_number: phone_number)
  end
end
