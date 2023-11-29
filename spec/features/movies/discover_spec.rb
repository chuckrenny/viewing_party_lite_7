require "rails_helper"

RSpec.describe "Discover Movies", type: :feature do
  before(:each) do
    @user = create :user
  end

  describe "redirect action from user dashboard" do
    it "routes from user dashboard to the discover movies page" do
      visit user_path(@user)

      click_button "Discover Movies"

      expect(page).to have_current_path discover_user_path(@user)
    end
  end

  # As an user,
  # When I visit the '/users/:id/discover' path, where :id, is the id of a valid user,
  # I should see

  # Button to Discover Top Rated Movies
  # A text field to enter keyword(s) to search by movie title
  # A Button to Search by Movie Title
  # Details When the user clicks on the Top Rated Movies OR the search button,
  # they should be taken to the movies results page (more details of this on the Movies Results Page issue.
  describe "button to discover top rated movies" do
    it "shows the TOP 20 highest rated movies from api" do
      visit discover_user_path(@user)

      click_button "Find Top Rated Movies"

      expect(page).to have_current_path user_movies_path(@user)
    end
  end

  describe "a search field for movie title" do
    it "returns the top 20 matches based on title query" do
      visit discover_user_path(@user)

      fill_in :search, with: "Star Wars"
      click_button "Find Movies"

      expect(path).to include "Star%20Wars"
    end
  end

  describe "redirect to movie show page when clicked" do
    it "visits the movie show page when movie link clicked" do
      movie = create :movie

      visit user_movie_path(@user, movie)
    end
  end
end
