# frozen_string_literal: true

require 'rails_helper'

describe 'ログイン後のitemscontrollerテスト' do
  let(:user) { create(:user) }
  let!(:item) { create(:item, user: user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '投稿のテスト' do
    describe "投稿画面のテスト" do
      before do
        visit new_item_path
      end
      context '表示の確認' do
        it 'new_item_pathが"/items/new"であるか' do
          expect(new_item_path).to eq('/items/new')
        end
        it "入力フォームがある" do
          expect(page).to have_field 'item[photo]'
          expect(page).to have_field 'item[title]'
          expect(page).to have_field 'item[detail]'
        end
        it '投稿ボタンが表示されているか' do
          expect(page).to have_button 'シェアする'
        end
      end
      context '投稿処理のテスト' do
        it '投稿後のリダイレクト先は正しいか' do
          fill_in 'item[title]', with: Faker::Lorem.characters(number:5)
          fill_in 'item[detail]', with: Faker::Lorem.characters(number:20)
          click_button 'シェアする'
          expect(page).to have_current_path items_path
        end
      end
    end

    describe "投稿一覧のテスト" do
      before do
        visit items_path
      end
      context '表示の確認' do
        it '投稿されたものが表示されているか' do
          expect(page).to have_content item.title
          expect(page).to have_link item.title
          expect(page).to have_content item.detail
        end
      end
    end

    describe "詳細画面のテスト" do
      before do
        visit item_path(item)
      end
      context '表示の確認' do
        it '削除ボタンが存在しているか' do
          expect(page).to have_link '投稿を消す'
        end
      end
      context 'item削除のテスト' do
        it 'itemの削除' do
          expect{ item.destroy }.to change{ Item.count }.by(-1)
        end
      end
    end
  end
end