
class WorldsBestRestaurants::Restaurant
  attr_accessor :name, :city, :country, :rank, :style, :url

  def self.today
    #I should return a bunch of instances of Restaurant

    self.scrape_restaurants
  end

  def self.scrape_restaurants
    restaurants = []

    restaurants << self.scrape
#  restaurants

  end

  def self.scrape
    doc = Nokogiri::HTML(open("https://www.theworlds50best.com/list/1-50-winners#t1-10"))
    binding.pry
  end
end
