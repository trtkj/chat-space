require 'rails_helper'

describe MessagesController, type: :controller do
  let(:group){ create(:group) }

  # ログインユーザー
  context "sign_in user access" do
    let(:user){ create(:user) }

    before do
      login_user user
    end

    describe "GET #index" do
      let(:message){Message.new(group_id: group.id, user_id: user.id)}
      before :each do
        get :index, params: { group_id: group }
      end

      # @groupに要求されたグループが割り当てられること
      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      # @messageに新しいメッセージが割り当てられること
      it "assigns a new message to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      # :indexテンプレートを表示すること
      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    describe "POST #create" do
      before :each do
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
      end

      # @groupに要求されたグループが割り当てられること
      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      # 送信成功時
      context "with valid attributes" do

        # 新しいメッセージをDBに保存すること
        it "saves the new message in the database" do
          expect do
            post :create, params: { group_id: group.id, message: attributes_for(:message) }
          end.to change(Message, :count).by(1)
        end

        # :indexテンプレートを表示すること
        it "redirects to message#index" do
          expect(response).to redirect_to group_messages_path
        end
      end

      # 送信失敗時
      context "with invalid attributes" do

        # メッセージをDBに保存しないこと
        it "doesn't save the message" do
          expect do
            post :create, params: { group_id: group.id, message: attributes_for(:invalid_message) }
          end.not_to change(Message, :count)
        end

        # :index テンプレートを表示すること
        it "renders the :index template" do
          post :create, params: { group_id: group.id, message: attributes_for(:invalid_message) }
          expect(response).to render_template :index

        end
      end
    end
  end

  # ゲストユーザー
  context "guest access" do
    describe "GET #index" do

      # サインイン画面にリダイレクトさせること
      it "redirects to sign_in template" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST #create" do

      # サインイン画面にリダイレクトさせること
      it "redirects to sign_in template" do
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end

