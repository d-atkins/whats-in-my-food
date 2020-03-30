class SearchFacade

  def initialize(search_params)
    @service = FdcService.new
    @search_params = search_params
  end

  def get_foods
    food_data = @service.get_food_data(@search_params)
    @foods ||= food_data.first(10).map do |food_info|
      Food.new(food_info)
    end
  end
end
