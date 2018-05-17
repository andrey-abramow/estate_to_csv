require 'curb'
require 'nokogiri'

class PageParser

  attr_reader :url

  def initialize(url: nil)
    @url = url
  end

  def call
  end

  private

  def domain
    uri = URI.parse(url)
    uri.scheme + "://" + uri.host
  end

  def page
    @page ||= Nokogiri::HTML(body_str)
  end

  def body_str
    @body_str ||= Curl.get(url, Rack::Utils.parse_query(URI(url).query)).body_str
  end

end