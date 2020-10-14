Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  # Map same_director_movies
  get '/movies/:id/same_director_movies', to: 'movies#same_director_movies', as: :same_director_movies  
end
