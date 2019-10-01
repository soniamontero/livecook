require_relative 'recipe'
require_relative 'scraper'
require 'open-uri'
require 'nokogiri'

class Controller
  def initialize(cookbook, view)
    @cookbook = cookbook
    @view = view
  end

  def search
    # 1. Ask user for a keyword
    ingredient = @view.ask_for("keyword")
    results = Scraper.new(ingredient).scrape
    @view.display(results)
    index = @view.ask_for("index").to_i - 1
    # 7. Import the recipe in the cookbook
    @cookbook.add(results[index])
  end

  def list
    @view.display(@cookbook.all)
  end

  def create
    name = @view.ask_for("name")
    description = @view.ask_for("description")
    prep_time = @view.ask_for("preptime")
    recipe = Recipe.new(name, description, prep_time)
    @cookbook.add(recipe)
  end

  def destroy
    index = @view.ask_for("index").to_i - 1
    @cookbook.remove(index)
  end
end
