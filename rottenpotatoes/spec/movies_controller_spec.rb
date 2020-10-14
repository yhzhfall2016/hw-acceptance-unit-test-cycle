require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
  before do
    post :create, movie: {:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25'}
    post :create, movie: {:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25'}
    post :create, movie: {:title => 'Alien', :rating => 'R', :release_date => '1979-05-25'}
    post :create, movie: {:title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11'}
  end

  describe "find movies with same director" do
    # Happy path
    it "should find movies with same director" do
      get :same_director_movies, id: 1
      director = Movie.find(1).director

      assigns(:movies).each do |movie|
        expect(movie.director).to eq(director)
      end
    end

    # Sad path
    it "should go to homepage if director is empty or nil" do
      get :same_director_movies, id: 3

      expect(assigns(:movies)).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end 