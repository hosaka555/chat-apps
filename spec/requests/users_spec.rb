require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) {FactoryBot.build(:user)}
  describe "#new" do
    it "ステータス200が返ってくること" do
      get signup_path
      expect(response.status).to eq 200
    end
  end

  describe "#create" do
    context "レコードに成功した場合" do
      subject {
        post create_user_path, params: {
            user: {
                user_name: user.user_name,
                email: user.email,
                password: user.password,
                password_confirmation: user.password_confirmation
            }
        }
      }
      it "Userテーブルにレコードが追加されていること" do
        expect {subject}.to change(User, :count).from(0).to(1)
      end

      it "マイページにリダイレクトされること" do
        expect(subject).to redirect_to mypage_path(user.user_name)
      end

      it "ユーザーを登録しましたというメッセージが表示されること" do
        subject
        expect(flash[:success]).to eq "ユーザーを登録しました"
      end
    end
    context "レコードに失敗した場合" do

      subject {
        post create_user_path, params: {
            user: {
                user_name: nil,
                email: user.email,
                password: user.password,
                password_confirmation: user.password_confirmation
            }
        }
      }
      it "Userテーブルにレコードが追加されていないこと" do
        expect {subject}.not_to change(User, :count)
      end
      it "再度サインアップ画面が表示されること" do
        expect(subject).to render_template(:new)
      end
      it "ユーザー登録に失敗しましたというメッセージが表示されること" do
        subject
        expect(flash[:danger]).to eq "ユーザー登録に失敗しました"
      end
    end
  end
end
