# frozen_string_literal: true

Rails.application.routes.draw do
  root 'jokes#index'
  post 'vote_joke/:id', to: 'jokes#vote', as: 'vote_joke'
end
