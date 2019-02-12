
#CLI Controller

class WorldsBestRestaurants::CLI

  def call
    greeting
    menu
    goodbye
  end

  def greeting
    puts <<-DOC.gsub /^\s*/, ''
      World's 50 Best Restaurants
      Please type a country that you would like to see on the list or type "list" to see the full list of restaurants.
    DOC

    input = gets.strip
    case input
    when "list"
      full_list
    #when "country"
    #etc. etc.
    end
  end

  def full_list
    puts "The World's 50 Best Restaurants:"
    @restaurants = WorldsBestRestaurants::Restaurant.today

    #lists restuarants with number
    @restaurants.each.with_index(1) do |restaurant, i|
      puts "#{i}. #{restaurant.name} - #{restaurant.city}, #{restaurant.country}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the restaurant you would like to see more information on, or type 'list' to see the full list or type 'exit' to leave this menu."
      input = gets.strip.downcase

      if input.to_i > 0
        the_restaurant = @restaurants[input.to_i-1]
        puts "#{the_restaurant.name} - #{the_restaurant.city}, #{the_restaurant.country}"
      elsif input == "list"
        full_list
      else
        puts "Please enter a number of a restaurant, list or exit."
      end
    end
  end

  def goodbye
    puts "Enjoy your meal!"
  end
  end
