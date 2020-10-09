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

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end
