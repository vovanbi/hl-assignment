# frozen_string_literal: true

class JokesController < ApplicationController
  before_action :load_joke, only: :vote

  def index
    @joke = Joke.where.not(id: voted_joke_ids)[0]
  end

  def vote
    create_vote

    redirect_to root_path
  end

  private

  def voted_joke_ids
    cookies.to_hash.keys.select { |key| key.start_with?('joke_') }.map { |key| key.split('_').last.to_i }
  end

  def create_vote
    return if cookies.signed["joke_#{vote_params[:id]}"]

    Vote.create(joke: @joke, vote_type: vote_params[:vote_type])

    cookies.signed["joke_#{vote_params[:id]}"] = true
  end

  def load_joke
    @joke = Joke.find(vote_params[:id])
  end

  def vote_params
    params.permit(:id, :vote_type)
  end
end
