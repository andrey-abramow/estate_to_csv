require 'csv'
require 'curb'

class RealEstateScrabStateWorker

  include Sidekiq::Worker

  def perform(state_url)
    # get data
    ::CSV.open("file.csv", "ab") do |csv|
      csv << ["Street_address1", "state1", "county", "zip code", 'price', 'bedrooms', 'year built', 'photos', 'url tohome']
    end
  end

end