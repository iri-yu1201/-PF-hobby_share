# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Itemモデルに関するテスト' do

    let(:user) { create(:user)}
    let!(:item) { build(:item, user_id: user.id)}

    context '保存' do
      it "有効な投稿内容の場合は保存されるか" do
        expect(FactoryBot.build(:item)).to be_valid
      end
    end
    context "空白のバリデーションチェック" do
      it "titleが空白の場合にバリデーションチェックされエラーメッセージが返ってきている" do
        item = Item.new(title: '', detail: 'hoge')
        expect(item).to be_invalid
        expect(item.errors[:title]).to include("can't be blank")
      end
      it "detailが空白の場合にバリデーションチェックされエラーメッセージが返ってきている" do
        item = Item.new(title: 'hoge', detail: '')
        expect(item).to be_invalid
        expect(item.errors[:detail]).to include("can't be blank")
      end
    end
  end
end