# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:votes).dependent(:destroy) }
  end
end
