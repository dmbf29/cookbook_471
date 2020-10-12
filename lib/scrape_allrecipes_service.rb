require_relative 'lib/recipe'
require 'nokogiri'
require 'open-uri'

class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.allrecipes.com/search/?wt=#{@keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    recipes = []
    doc.search('.recipe-section .fixed-recipe-card').first(5).each do |recipe_card|
      name =  recipe_card.search('.fixed-recipe-card__title-link').first.text.strip
      description = recipe_card.search('.fixed-recipe-card__description').text.strip

      recipe_url = recipe_card.search('.grid-card-image-container a').first.attribute('href').value
      prep_time = get_prep_time(recipe_url)
      rating = recipe_card.search('.fixed-recipe-card__ratings span').attribute("aria-label").value
      recipes << Recipe.new(
        name: name,
        description: description,
        prep_time: prep_time,
        rating: rating
      )
    end
    return recipes
  end

  def get_prep_time(url)
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.search('.recipe-meta-item-body').first.text.strip
  end






end
