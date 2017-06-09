require "rails_helper"

describe Message do
  describe "#create" do
    let(:message) do
        create(:message)
    end

    # メッセージを保存できる場合
    ## メッセージがあれば画像がなくても保存できる
    it "is valid with body" do
        message.image = nil
        expect(message).to be_valid
    end

    ## 画像があればメッセージがなくても保存できる
    it "is valid with image" do
        message.body = nil
        expect(message).to be_valid
    end

    ## メッセージと画像があれば保存できる
    it "is valid with body and image" do
        expect(message).to be_valid
    end

    # メッセージを保存できない場合
    ## メッセージも画像も無いと保存できない
    it "is invalid without both body and image" do
        message.body = nil
        message.image = nil
        message.valid?
        expect(message.errors[:body][0]).to include("を入力してください")
    end

    ## group_idが無いと保存できない
    it "is invalide without group_id" do
        message.group_id = nil
        message.valid?
        expect(message.errors[:group_id][0]).to include("を入力してください")
    end

    ## user_idが無いと保存できない
    it "is invalid without user_id" do
        message.user_id = nil
        message.valid?
        expect(message.errors[:user_id][0]).to include("を入力してください")
    end
  end
end
