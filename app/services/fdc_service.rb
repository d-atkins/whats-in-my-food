class FdcService
  def get_food_data(search_params)
    response = conn.get("/fdc/v1/search?ingredients=#{search_params}")
    JSON.parse(response.body, symbolize_names: true)[:foods]
  end

  private
    def conn
      Faraday.new(url: "https://api.nal.usda.gov") do |f|
        f.params["api_key"] = ENV['FDC_API_KEY']
      end
    end
end
