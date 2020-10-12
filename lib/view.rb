class View
  def display(recipes) # an array of INSTANCES
    if recipes.any?
      recipes.each_with_index do |recipe, index|
        x_mark = recipe.done? ? "X" : " "
        puts "#{index + 1}- [#{x_mark}] - #{recipe.name.capitalize} - #{recipe.description} - Prep: #{recipe.prep_time} - #{recipe.rating}"
      end
    else
      puts "No recipes yet 😢"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    print '> '
    gets.chomp
  end
end
