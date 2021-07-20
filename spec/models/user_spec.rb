# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe  'Userモデルに関するテスト' do
    context '保存' do
      it "記述漏れがなければ保存されるか" do
        expect(FactoryBot.build(:user)).to be_valid
      end
    end
    context '空白のバリデーション' do
      it '名前が空白' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
      it 'メールアドレスが空白' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it 'パスワードが空白' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
    end
    context 'パスワードのバリデーション' do
      it 'パスワードが確認用と一致しない' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end