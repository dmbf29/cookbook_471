require_relative 'view'

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
    name = @view.ask_for_name
    # ask the user for a description
    description = @view.ask_for_description
    # create an instance of a recipe
    recipe = Recipe.new(name, description)
    # save it aka give to cookbook
    @cookbook.add(recipe)
  end

  def destroy
    # display the recipes
    display_recipes
    # ask the user which one (index)
    index = @view.ask_for_index
    # tell the cookbook to remove
    @cookbook.remove(index)
  end

  private

  def display_recipes
    # ask the cookbook for all the recipes
    recipes = @cookbook.all
    # give them to the view so it can puts
    @view.display(recipes)
  end
end
