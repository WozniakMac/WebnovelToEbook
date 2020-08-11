# frozen_string_literal: true

Rails.application.routes.draw do
  resources :ebooks, only: %i[index show new create destroy], param: :slug do
    member do
      post :generate
    end
  end
  root "ebooks#new"
end
