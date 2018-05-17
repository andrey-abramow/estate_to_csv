class Coldwellbankerhomes::StatesParser < PageParser

  def call
    state_links
  end

  def state_links
     @state_links ||= page.css('section.content table tbody tr a', 'tbody tr a')
                          .map { |link| "#{domain}#{link['href']}" }
  end

end