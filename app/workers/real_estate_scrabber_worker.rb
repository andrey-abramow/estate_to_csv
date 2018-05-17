require 'csv'
require 'curb'
require 'nokogiri'

class RealEstateScrabberWorker

  include Sidekiq::Worker

  SITE_URL = 'https://www.coldwellbankerhomes.com/sitemap/real-estate/'


  def perform(*args)

    http = Curl.get(SITE_URL)

    doc = Nokogiri::HTML(http.body_str)

    doc.css('section.content tr a', 'a').each do |link|
      puts link['href']
    end
    # ::CSV.open("file.csv", "wb") do |csv|
    #   csv << ["Street_address", "state", "county", "zip code", 'price', 'bedrooms', 'year built', 'photos', 'url to home']
    # end

    # RealEstateScrabStateWorker.perform_async('state_url');
    # RealEstateScrabStateWorker.perform_async('state_url')
    # RealEstateScrabStateWorker.perform_async('state_url')
    # RealEstateScrabStateWorker.perform_async('state_url')
    # RealEstateScrabStateWorker.perform_async('state_url')
  end

end