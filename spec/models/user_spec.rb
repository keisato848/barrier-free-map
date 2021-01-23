require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録がうまくいくとき' do
      it 'email、password、nicknameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録がうまくいかないとき' do
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordは半角英数混合でないと登録できない' do
        @user.password = 123456
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it '同じnicknameがすでに存在する場合登録できない' do
        @user.nickname = "テストタロウ"
        @user.save
        @user2 = build(:user)
        @user2.nickname = "テストタロウ"
        @user2.valid?
        expect(@user2.errors.full_messages).to include("ニックネームはすでに存在します")
      end
      it 'profileが141字以上だと登録できない' do
          @user.profile = "a" * 141
          @user.valid?
          expect(@user.errors.full_messages).to include("プロフィールは140文字以内で入力してください")
      end    
    end
  end
end
