require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@があれば登録できる" do
        @user.email = "test@test.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数字混同であれば登録できる" do
        @user.password = "test00"
        @user.password_confirmation = "test00"
        expect(@user).to be_valid
      end
      it "last_name、first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "零ぜろゼロ"
        @user.first_name = "零ぜろゼロ"
        expect(@user).to be_valid
      end
      it "last_name_kana、first_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.last_name_kana = "ゼロゼロゼロ"
        @user.first_name_kana = "ゼロゼロゼロ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が存在しない場合登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "test0"
        @user.password_confirmation = "test0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passworに全角文字が存在する場合登録できない" do
        @user.password = "パスワード"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに半角アルファベットが存在しない場合登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに半角数字が存在しない場合登録できない" do
        @user.password = "testtest"
        @user.password_confirmation = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaがカタカナでないと登録できない" do
        @user.last_name_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaがカタカナでないと登録できない" do
        @user.first_name_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
