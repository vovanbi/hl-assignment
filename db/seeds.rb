# frozen_string_literal: true

require 'faker'

puts 'Migration data'

jokes = []
100.times { |i| jokes << { content: "No. #{i} #{Faker::TvShows::NewGirl.quote}" } }
Joke.insert_all(jokes)

puts 'Migration data Joke successful !!!'
