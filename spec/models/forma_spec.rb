require 'rails_helper'

RSpec.describe Forma, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @forma = FactoryBot.build(:forma, user_id: user.id, item_id: item.id)
  end
  describe '配送情報の保存' do
    context '内容に問題なくて配送情報を保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        @forma.valid?
        expect(@forma).to be_valid
      end

      it '建物は空でも保存できること' do
        @forma.building = ''
        expect(@forma).to be_valid
      end
    end

    context '内容に問題があって配送情報を保存できない場合' do
      it '郵便番号が空だと保存できないこと' do
        @forma.postal_code = ''
        @forma.valid?
        expect(@forma.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が半角のハイフンを含んでないと保存できない' do
        @forma.postal_code = '1234567'
        @forma.valid?
        expect(@forma.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が半角数字でないと保存できない' do
        @forma.postal_code = '１２３-４５６７'
        @forma.valid?
        expect(@forma.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空だと保存できない' do
        @forma.prefecture_id = ''
        @forma.valid?
        expect(@forma.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が「---」だと保存できない' do
        @forma.prefecture_id = 1
        @forma.valid?
        expect(@forma.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が空だと保存できない' do
        @forma.city = ''
        @forma.valid?
        expect(@forma.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できない' do
        @forma.address = ''
        @forma.valid?
        expect(@forma.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @forma.phone_number = ''
        @forma.valid?
        expect(@forma.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は10桁未満では保存できない' do
        @forma.phone_number = '090123456'
        @forma.valid?
        expect(@forma.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は12桁以上では保存できない' do
        @forma.phone_number = '090123456789'
        @forma.valid?
        expect(@forma.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は半角数値のみでないと保存できない（ハイフン不要）' do
        @forma.phone_number = '090-1234-5678'
        @forma.valid?
        expect(@forma.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと保存できない' do
        @forma.user_id = nil
        @forma.valid?
        expect(@forma.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @forma.item_id = nil
        @forma.valid?
        expect(@forma.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空だと保存できないこと' do
        @forma.token = nil
        @forma.valid?
        expect(@forma.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
