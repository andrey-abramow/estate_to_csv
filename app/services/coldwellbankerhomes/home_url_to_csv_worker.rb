require 'csv'

class Coldwellbankerhomes::HomeUrlToCsvWorker

  include Sidekiq::Worker

  def perform(home_url, file_name)
    home_data = Coldwellbankerhomes::HomeParser.new(url: home_url).call
    row = home_data.slice(:street_address, :state, :county, :zip_code, :price, :bedrooms, :year_build, :photos, :url).values

    ::CSV.open(file_name, "ab") do |csv|
      csv << row
    end
  end

end