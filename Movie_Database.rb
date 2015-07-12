require 'pry'
require 'csv'

class Nmdb #Niki's movie data base

  attr_reader :summary, :rating, :name

  def initialize(n, s, r)
    @name = n
    @summary = s
    @rating = r
  end


  def information
    puts name + ": "
    puts "Summary: " + summary# + "; Rating: " + rating.to_s
    puts "Rating: " + rating.to_s
  end

end


class Movies

  attr_reader :name, :movies

  def initialize(database_name)
    @name = database_name

    @movies = []
    CSV.foreach("movies.csv") do |row|
      n = row[0]
      s = row[1]
      r = row[2]
      nmdb = Nmdb.new(n, s, r)

      add_movies [nmdb]
    end
  end

  def add_movies(movies_array)
    @movies+= movies_array
  end

  def summary
    @movies.each do |m|
      puts m.information
    end
  end
end

movies = Movies.new("Niki's movie data base")
movies.summary





