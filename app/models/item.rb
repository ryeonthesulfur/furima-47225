class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :user

  validates :item_name, presence: true
  validates :description, presence: true

  with_options presence: true, numericality: { only_integer: true, other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :shipping_days_id
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  has_one_attached :image
  validates :image, presence: true
end
