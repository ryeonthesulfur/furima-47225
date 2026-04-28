class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday,
            presence: true

  validates :first_name, :last_name,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }

  validates :first_name_kana, :last_name_kana,
            format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を使用してください' }, length: { minimum: 6 }
end
