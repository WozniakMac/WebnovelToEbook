# frozen_string_literal: true

Rails.application.routes.draw do
  resources :ebooks, only: %i[index show new create destroy], param: :slug
  root "ebooks#new"
end
