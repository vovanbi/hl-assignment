# frozen_string_literal: true

require 'faker'

puts 'Migration data'

jokes = []
20.times { |i| jokes << { content: "No. #{i} #{Faker::TvShows::NewGirl.quote * 10}" } }
Joke.insert_all(jokes)

puts 'Migration data Joke successful !!!'
