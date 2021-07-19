# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:item)).to be_valid
  end
  context "空白のバリデーションチェック"
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      
    end
end