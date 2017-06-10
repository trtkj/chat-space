require 'rails_helper'


describe MessagesController, type: :controller do
  # ログインユーザー
  describe "sign_in user access" do
    let(:message){create(:message)}
    let(:user){User.find(message.user_id)}
    let(:group){Group.find(message.group_id)}

    before do
      login_user user
    end

    describe "GET #index" do
      # @groupに要求されたグループが割り当てられること
      it "assigns the requested group to @group" do
        get :index, params: {group_id: group}
        expect(assigns(:group)).to eq group
      end

      # # @messageに新しいメッセージが割り当てられること
      # it "assigns a new message to @message" do
      # end

      # # :indexテンプレートを表示すること
      # it "renders the :index template" do
      # end
    end

    # describe "POST #create" do

    #   # @groupに要求されたグループが割り当てられること
    #   it "assigns the requested group to @group" do
    #   end

    #   # @messageに要求されたメッセージが割り当てられること
    #   it "assigns the requested message to @message" do
    #   end

    #   # 送信成功時
    #   context "with valid attributes" do

    #     # 新しいメッセージをDBに保存すること
    #     it "saves the new message in the database" do
    #     end

    #     # :indexテンプレートを表示すること
    #     it "renders the :index template" do
    #     end
    #   end

    #   # 送信失敗時
    #   context "with invalid attributes" do

    #     # メッセージをDBに保存しないこと
    #     it "doesn't save the message" do
    #     end

    #     # :index テンプレートを表示すること
    #     it "renders the :index template" do
    #     end
    #   end
    # end
  end

  # # ゲストユーザー
  # describe "guest access" do

  #   describe "GET #index" do

  #     # サインイン画面にリダイレクトさせること
  #     it "redirects to sign_in template" do
  #     end
  #   end

  #   describe "POST #create" do

  #     # サインイン画面にリダイレクトさせること
  #     it "redirects to sign_in template" do
  #     end
  #   end
  # end
end

