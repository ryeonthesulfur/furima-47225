class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :user

  validates :category_id, :condition_id, :burden_id, :prefecture_id, :shipping_days_id, numericality: { other_than: 1 }

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_days_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A\d+\z/, message: 'Half-width number' }

  has_one_attached :image
end
