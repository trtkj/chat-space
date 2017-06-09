require "rails_helper"

describe Message do
  describe "#create" do
    # メッセージを保存できる場合
    ## メッセージがあれば保存できる
    ## 画像があれば保存できる
    ## メッセージと画像があれば保存できる
    # メッセージを保存できない場合
    ## メッセージも画像も無いと保存できない
    ## group_idが無いと保存できない
    ## user_idが無いと保存できない
end
