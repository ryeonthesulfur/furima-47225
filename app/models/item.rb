class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExpressions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :user
end
