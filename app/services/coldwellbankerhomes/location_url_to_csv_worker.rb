require 'csv'

class Coldwellbankerhomes::LocationUrlToCsvWorker

  include Sidekiq::Worker

  def perform(location_url, file_name)
    location = Coldwellbankerhomes::LocationParser.new(url: location_url)

    location.home_urls.each do |home_url|
      Coldwellbankerhomes::HomeUrlToCsvWorker.perform_async(home_url, file_name)
    end

    if location.next_location_url
      Coldwellbankerhomes::LocationUrlToCsvWorker.perform_async(location.next_location_url, file_name)
    end
  end

end