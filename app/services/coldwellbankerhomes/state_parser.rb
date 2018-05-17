class Coldwellbankerhomes::StateParser < PageParser

  def call
    location_urls
  end

  def location_urls
     @location_urls ||= page.css('section.content table tbody tr a', 'tbody tr a')
                             .map { |link| "#{domain}#{link['href']}" }
  end

end