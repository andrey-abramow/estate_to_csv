class Coldwellbankerhomes::StatesParser < PageParser

  URL = "#{Coldwellbankerhomes::DOMAIN}/sitemap/real-estate/"

  def call
  #   return array of state links
    state_links
  end

  def state_links
     @state_links ||= page.css('section.content table tbody tr a', 'tbody tr a')
                          .map { |link| "#{Coldwellbankerhomes::DOMAIN}#{link['href']}" }
  end

end