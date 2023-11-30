class Movie
  attr_reader :id,
    :title,
    :vote_average,
    :overview,
    :runtime,
    :genres,
    :cast,
    :reviews,
    :poster_path

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @poster_path = attributes[:poster_path]
  end

  def set_genres_and_runtime(data)
    @genres = data[:genres].map { |genre| genre[:name] }
    @runtime = data[:runtime]
  end

  def set_cast_and_reviews(data)
    @cast = data[:cast]
    @reviews = data[:reviews]
  end
end
