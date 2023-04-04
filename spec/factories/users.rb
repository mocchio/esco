FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4, mix_case: true) }
    password_confirmation { password }
    nickname { Faker::Name.first_name }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    last_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birthday { Faker::Date.backward }
    introduction { Faker::Lorem.sentence }
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') }
  end
end