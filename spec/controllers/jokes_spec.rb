# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JokesController, type: :controller do
  let!(:joke1) { create(:joke) }
  let!(:joke2) { create(:joke) }
  let!(:vote) { create(:vote, joke: joke1) }

  describe 'GET #index' do
    context 'when there are no voted jokes' do
      it 'assigns the first joke to @joke' do
        get :index
        expect(assigns(:joke)).to eq(joke1)
      end
    end

    context 'when there are voted jokes' do
      before do
        cookies.signed["joke_#{joke1.id}"] = true
      end

      it 'assigns the first non-voted joke to @joke' do
        get :index
        expect(assigns(:joke)).to eq(joke2)
      end
    end
  end

  describe 'POST #vote' do
    context 'when voting for a joke' do
      before do
        request.cookies["joke_#{joke2.id}"] = nil
      end

      it 'creates a vote' do
        expect do
          post :vote, params: { id: joke2.id, vote_type: 'like' }
        end.to change(Vote, :count).by(1)
      end

      it 'sets a cookie for the voted joke' do
        post :vote, params: { id: joke2.id, vote_type: 'like' }
        expect(cookies.signed["joke_#{joke2.id}"]).to be_truthy
      end

      it 'redirects to the root path' do
        post :vote, params: { id: joke2.id, vote_type: 'like' }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a joke is already voted' do
      before do
        cookies.signed["joke_#{joke1.id}"] = true
      end

      it 'does not create a new vote' do
        expect do
          post :vote, params: { id: joke1.id, vote_type: 'like' }
        end.not_to change(Vote, :count)
      end
    end
  end
end
