class Coldwellbankerhomes::LocationParser < PageParser

  ITEMS_ON_PAGE = 24

  def home_urls
     @home_urls ||= page.css('div.property-snapshot-psr-panel', 'div.property-snapshot-psr-panel')
                        .map { |div| "#{domain}#{div['data-detailurl']}" }
  end

  def next_location_url
    return unless home_urls.count == ITEMS_ON_PAGE
    current_url = URI(url)
    queryObj = Rack::Utils.parse_query current_url.query
    offset = (queryObj['offset'].to_i || 0) + ITEMS_ON_PAGE
    current_url.query = { offset: offset }.to_query
    current_url.to_s
  end

end