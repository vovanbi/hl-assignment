# frozen_string_literal: true

class Joke < ApplicationRecord
  has_many :votes, dependent: :destroy
end
