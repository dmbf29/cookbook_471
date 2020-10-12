class Recipe
  attr_reader :name, :description, :prep_time, :rating

  # def initialize(name, description, prep_time)
  # pass in the attributes as a hash
  def initialize(attributes = {})
    # attributes[key]
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @rating = attributes[:rating]
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = !@done
  end
end


# p Recipe.new({
#                name: 'sexy fish stew',
#                prep_time: '30min',
#                done: nil
# })

# Recipe.new('sexy fish stew', 'most delicious stew', '30min')






#
