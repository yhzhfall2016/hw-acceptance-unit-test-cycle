require 'rails_helper'

RSpec.describe Movie, :type => :model do
  before do
    Movie.create!(:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25')
    Movie.create!(:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25')
    Movie.create!(:title => 'Alien', :rating => 'R', :release_date => '1979-05-25')
    Movie.create!(:title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11')
  end

  describe "find movies with same director" do
    # Happy path
    it "should find movies with same director" do
      movie = Movie.find_title "Star Wars"
      Movie.same_director(movie).each do |mv|
        expect(mv.director).to eq(movie.director)
      end
    end

    # Sad path
    it "should not find anything if director is empty or nil" do
      movie = Movie.find_title "Alien"
      Movie.same_director(movie).each do |mv|
        expect(mv).to eq(movie)
      end
    end
  end
end 