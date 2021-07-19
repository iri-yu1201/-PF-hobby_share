# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, 'モデルに関するテスト', type: :model do
  descrive '保存' do
    it "記述漏れがなければ保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
end