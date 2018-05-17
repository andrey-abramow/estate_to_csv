require 'csv'

class Coldwellbankerhomes::Scrabber

  DOMAIN = 'https://www.coldwellbankerhomes.com'

  COLUMNS = ['Street address', 'state', 'county', 'zip code', 'price', 'bedrooms', 'year built', 'photos', 'url to home'].freeze

  class << self
    attr_accessor :file_name
  end

  def call
    create_file

    fill
  end

  def fill
    Coldwellbankerhomes::StateUrlToCsvWorker.perform_async(state_urls[5], self.class.file_name)
    # state_urls.each do |state_url|
    #   Coldwellbankerhomes::StateUrlToCsvWorker.perform_async(state_url, self.class.file_name)
    # end
  end

  def create_file
    ::CSV.open(self.class.file_name, "wb") do |csv|
      csv << COLUMNS
    end
  end

  def state_urls
     @state_urls ||= Coldwellbankerhomes::StatesParser.new(url: "#{DOMAIN}/sitemap/real-estate/").call
  end

end