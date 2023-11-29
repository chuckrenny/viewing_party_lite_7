class Movie
  attr_reader :id,
    :title,
    :vote_average,
    :overview,
    :runtime,
    :genres,
    :cast,
    :reviews

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @overview = attributes[:overview]
    @poster_path = attributes[:poster_path]
  end

  def set_genres_and_duration(data)
    @genres = data[:genres].map { |genre| genre[:name] }
    @runtime = data[:runtime]
  end
end