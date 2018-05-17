require 'curb'
require 'nokogiri'

class PageParser

  def call
    # should retur page data
    raise 'Override'
  end

  private

  def page
    @page ||= parse_page
  end

  def parse_page
    http = Curl.get(self.class::URL)
    Nokogiri::HTML(http.body_str)
  end

end