require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    user = FactoryBot.create(:user)
    @reservation = FactoryBot.build(:reservation,user_id: user.id)
    sleep 0.1
  end  
  
  describe '予約申し込み機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@reservation).to be_valid
      end

      it 'allergyは空でも保存できること' do
        @reservation.allergy = ''
        expect(@reservation).to be_valid
      end

      it 'contactは空でも保存できること' do
        @reservation.contact = ''
        expect(@reservation).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'start_dateがないと保存できないこと' do
        @reservation.start_date = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Start date can't be blank")
      end 

      it 'start_dateが過去の日付だと保存できないこと' do
        @reservation.start_date = '2022-06-30'
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Start date cannot select past date")
      end 

      it 'timeがないと保存できないこと' do
        @reservation.time = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Time can't be blank")
      end 

      it 'children_number_idがないと保存できないこと' do
        @reservation.children_number_id = 1
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Children number can't be blank")
      end 
      
      it 'children_nameがないと保存できないこと' do
        @reservation.children_name = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Children name can't be blank")
      end 
      
      it 'age_idがないと保存できないこと' do
        @reservation.age_id = 1
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Age can't be blank")
      end 
      
      it 'phone_numberがないと保存できないこと' do
        @reservation.phone_number = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Phone number can't be blank")
      end 

      it 'phone_numberが全角だと保存できないこと' do
        @reservation.phone_number = '１１１２２２３３３４'
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Phone number Half-width number")
      end

      it 'priceがないと保存できないこと' do
        @reservation.price = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Price can't be blank")
      end 

      it 'tokenがないと保存できないこと' do
        @reservation.token = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @reservation.user_id = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("User can't be blank", "User must exist")
      end
    end  
  end
    
end
