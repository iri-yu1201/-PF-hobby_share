# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemComment, type: :model  do
  describe 'ItemCommentモデルに関するテスト' do
    it "コメントの保存はされるか" do
      expect(FactoryBot.build(:item_comment)).to be_valid
    end
  end
end