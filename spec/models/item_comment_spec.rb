# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効なコメントの場合は保存されるか" do
    expect(FactoryBot.build(:item_comment)).to be_valid
  end
end