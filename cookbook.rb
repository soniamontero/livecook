require 'csv'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  def remove(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def all
    @recipes
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2])
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time]
      end
    end
  end
end
