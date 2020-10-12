require_relative 'view'
require_relative 'scrape_allrecipes_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
    # do something
  end

  def create
    # ask the user for a name
    name = @view.ask_for('name')
    # ask the user for a description
    description = @view.ask_for('description')
    prep_time = @view.ask_for('prep time')
    # create an instance of a recipe
    recipe = Recipe.new(
      name: name,
      description: description,
      prep_time: prep_time
    )
    # save it aka give to cookbook
    @cookbook.add(recipe)
  end

  def destroy
    # display the recipes
    display_recipes
    # ask the user which one (index)
    index = @view.ask_for('number').to_i - 1
    # tell the cookbook to remove
    @cookbook.remove(index)
  end

  def import
    # ask user for a keyword
    keyword = @view.ask_for("keyword")
    # search AllRecipes for that keyword
    recipes = ScrapeAllrecipesService.new(keyword).call
    @view.display(recipes)
    index = @view.ask_for('number to import').to_i - 1
    recipe = recipes[index]
    @cookbook.add(recipe)
  end

  def mark
    display_recipes
    index = @view.ask_for('number to mark').to_i - 1
    @cookbook.mark_as_done(index)
  end

  private

  def display_recipes
    # ask the cookbook for all the recipes
    recipes = @cookbook.all
    # give them to the view so it can puts
    @view.display(recipes)
  end
end
