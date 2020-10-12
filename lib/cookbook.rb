require 'csv'
require_relative 'recipe'

class Cookbook

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path # string
    @recipes = [] # array
    load_csv # block of code
  end

  def all
    @recipes
  end

  def add(recipe) # INSTANCE
    @recipes << recipe
    save_csv
  end

  def remove(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['name', 'description', 'prep_time', 'rating', 'done']
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.rating, recipe.done?]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |attributes|
      # we need to update attributes[:done]
      attributes[:done] = (attributes[:done] == 'true')
      @recipes << Recipe.new(attributes)
    end
  end
end
