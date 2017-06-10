FactoryGirl.define do

  factory :message do
    body      "イルカかわいい"
    image     { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/img/iruka.jpg", 'image/jpg') }
    group
    user

    factory :invalid_message do
      body nil
      image nil
    end
  end

end
