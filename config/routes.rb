Rails.application.routes.draw do

  devise_for :users
  root to: "pages#index", as: "index"

  #get

  get "memes/new" => "memes#new", as: "newmeme"
  get "meme_templates/new" => "meme_templates#new", as: "newtemplate"


  get "memes/:id" => "memes#show", as: "meme"
  get "meme_templates/:id" => "meme_templates#show"

  #post

  post "meme_templates" => "meme_templates#create"
  post "memes" => "memes#create"

end