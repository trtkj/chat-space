FactoryGirl.define do

  factory :message do
    body      "イルカかわいい"
    image     { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/img/iruka.jpg", 'image/jpg') }
    group_id  "1"
    user_id   "1"
  end

end
