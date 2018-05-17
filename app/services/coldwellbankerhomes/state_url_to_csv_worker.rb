require 'csv'

class Coldwellbankerhomes::StateUrlToCsvWorker

  include Sidekiq::Worker

  def perform(state_url, file_name)
    location_urls = Coldwellbankerhomes::StateParser.new(url: state_url).location_urls

    location_urls.each do |location_url|
      Coldwellbankerhomes::LocationUrlToCsvWorker.perform_async(location_url, file_name)
    end

  end

end