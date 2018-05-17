require 'csv'

class RealEstateScrabberWorker
  include Sidekiq::Worker

  def perform(*args)
    ::CSV.open("file.csv", "wb") do |csv|
      csv << ["Street_address", "state", "county", "zip code", 'price', 'bedrooms', 'year built', 'photos', 'url tohome']
    end

    RealEstateScrabStateWorker.perform_async('state_url');
    RealEstateScrabStateWorker.perform_async('state_url')
    RealEstateScrabStateWorker.perform_async('state_url')
    RealEstateScrabStateWorker.perform_async('state_url')
    RealEstateScrabStateWorker.perform_async('state_url')
  end

end