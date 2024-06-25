# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :joke, null: false, foreign_key: true
      t.string :vote_type

      t.timestamps
    end
  end
end
