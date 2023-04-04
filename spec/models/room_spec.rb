require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe '新規ルーム作成' do
    context '新規ルーム作成ができるとき' do
      it '全ての情報が入力されていればルームを作成できる' do
        expect(@room).to be_valid
      end
    end

    context '新規ルーム作成ができないとき' do
      it 'nameが空ではルームを作成できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
      it 'habitが空ではルームを作成できない' do
        @room.habit = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Habit can't be blank")
      end
      it 'ruleが空ではルームを作成できない' do
        @room.rule = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Rule can't be blank")
      end
      it 'levelが選択されていないとき、ルームを作成できない' do
        @room.level_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Level can't be blank")
      end
      it 'creatorと紐づいていないとき、ルームを作成できない' do
        @room.creator = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Creator must exist")
      end
    end
  end
end
