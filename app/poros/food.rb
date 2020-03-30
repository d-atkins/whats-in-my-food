class Food
  attr_reader :description, :code, :brand_owner, :ingredients

  def initialize(attributes)
    @description = attributes[:description]
    @code = attributes[:gtinUpc]
    @brand_owner = attributes[:brandOwner]
    @ingredients = attributes[:ingredients]
  end
end
