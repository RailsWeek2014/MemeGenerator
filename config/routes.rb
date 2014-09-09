Rails.application.routes.draw do
namespace :acp do
  resources :users, only: [:index, :edit, :update, :destroy]
  resources :memes, only: [:index, :destroy]
  resources :meme_templates, only: [:index, :destroy]
end
  devise_for :users
  root to: "pages#index", as: "index"

  #get

  get "memes/new" => "memes#new", as: "newmeme"
  get "meme_templates/new" => "meme_templates#new", as: "newtemplate"
  get "memes/list" => "memes#list", as: "list_meme"
  get "meme_templates/list" => "meme_templates#list", as: "list_meme_template"

  get "memes/:id" => "memes#show", as: "meme"
  get "meme_templates/:id" => "meme_templates#show", as: "meme_template"

  #post

  delete "meme_templates/:id" => "meme_templates#delete", as: "delete_meme_template"

  delete "memes/:id" => "memes#delete", as: "delete_meme"

  post "meme_templates" => "meme_templates#create"

  post "memes" => "memes#create"

end