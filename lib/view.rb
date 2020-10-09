class View
  def display(recipes) # an array of INSTANCES
    if recipes.any?
      recipes.each_with_index do |recipe, index|
        puts "#{index + 1} - #{recipe.name.capitalize} - #{recipe.description}"
      end
    else
      puts "No recipes yet 😢"
    end
  end

  def ask_for_name
    puts "What's the name?"
    gets.chomp
  end

  def ask_for_description
    puts "What's the description?"
    gets.chomp
  end

  def ask_for_index
    puts "What's the number?"
    gets.chomp.to_i - 1
  end
end
