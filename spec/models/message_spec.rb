require "rails_helper"

describe Message do
  describe "#create" do

    # メッセージを保存できる場合
    ## メッセージがあれば画像がなくても保存できる
    it "is valid with body" do
        message = create(:message, image: nil)
        expect(message).to be_valid
    end

    ## 画像があればメッセージがなくても保存できる
    it "is valid with image" do
        message = create(:message, body: nil)
        expect(message).to be_valid
    end

    ## メッセージと画像があれば保存できる
    it "is valid with body and image" do
        message = create(:message)
        expect(message).to be_valid
    end

    # メッセージを保存できない場合
    ## メッセージも画像も無いと保存できない
    it "is invalid without both body and image" do
    end

    ## group_idが無いと保存できない
    it "is invalide without group_id" do
    end

    ## user_idが無いと保存できない
    it "is invalid without user_id" do
    end
  end
end
