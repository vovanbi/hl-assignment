# frozen_string_literal: true

FactoryBot.define do
  factory :joke do
    content { Faker::TvShows::NewGirl.quote }
  end
end
