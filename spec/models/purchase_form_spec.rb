require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '購入処理がうまくいくとき' do
      it '必要項目が入力されていれば登録できる' do
        expect(@purchase_form).to be_valid
      end
      it '建物名は空でも登録できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end
    context '購入処理がうまくいかないとき' do
      it 'クレジットカード情報が空だと保存できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと登録できない' do
        @purchase_form.post_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号はハイフンを含むこと' do
        @purchase_form.post_code = 1_234_567
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Post code is invalid')
      end
      it '郵便番号は半角数字であること(全角)' do
        @purchase_form.post_code = '１２３−４５６７'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Post code is invalid')
      end
      it '郵便番号は半角数字であること(文字列)' do
        @purchase_form.post_code = '郵便番号'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県が未選択だと登録できないこと' do
        @purchase_form.prefecture_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県の選択が１だと登録できないこと' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空だと登録できないこと' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank", 'City is invalid')
      end
      it '市区町村は文字列を含むこと(半角数字)' do
        @purchase_form.city = 1234
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('City is invalid')
      end
      it '市区町村は文字列を含むこと(全角数字)' do
        @purchase_form.city = '１２３４'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('City is invalid')
      end
      it '市区町村は日本語であること(半角英字)' do
        @purchase_form.city = 'fukuoka'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('City is invalid')
      end
      it '市区町村は日本語であること(全角英字)' do
        @purchase_form.city = 'FUKUOKA'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('City is invalid')
      end
      it '番地が空だと登録できないこと' do
        @purchase_form.block = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Block can't be blank")
      end
      it '番地は文字列を含むこと(半角数字)' do
        @purchase_form.block = 1234
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Block is invalid')
      end
      it '番地は文字列を含むこと(全角数字)' do
        @purchase_form.block = '１２３４'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Block is invalid')
      end
      it '番地は日本語であること(半角英字)' do
        @purchase_form.block = 'fukuoka'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Block is invalid')
      end
      it '番地は日本語であること(全角英字)' do
        @purchase_form.block = 'FUKUOKA'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Block is invalid')
      end
      it '電話番号が空だと登録できないこと' do
        @purchase_form.phon_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phon number can't be blank")
      end
      it '電話番号は半角数字であること(全角数字)' do
        @purchase_form.phon_number = '１２３４５６７８９０'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phon number is not a number')
      end
      it '電話番号は半角数字であること(文字列)' do
        @purchase_form.phon_number = '電話番号'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phon number is not a number')
      end
      it '電話番号は半角数字であること(半角英字)' do
        @purchase_form.phon_number = 'denwa'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phon number is not a number')
      end
      it '電話番号は半角数字であること(全角英字)' do
        @purchase_form.phon_number = 'DENWA'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phon number is not a number')
      end
      it '電話番号は10文字以上であること' do
        @purchase_form.phon_number = 123_456_789
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phon number is too short (minimum is 10 characters)')
      end
      it 'user_idが無ければ登録できないこと' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが無ければ登録できないこと' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
