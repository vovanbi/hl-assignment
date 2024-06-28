# frozen_string_literal: true

FactoryBot.define do
  factory :vote do
    association :joke
    vote_type { %w[like dislike].sample }
  end
end
