class View
  def ask_for(stuff)
    puts "#{stuff}?"
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} (#{recipe.prep_time}) - #{recipe.description}"
    end
  end
end
