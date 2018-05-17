require 'csv'

class Coldwellbankerhomes::Scrabber

  COLUMNS = ["Street_address", "state", "county", "zip code", 'price', 'bedrooms', 'year built', 'photos', 'url to home']

  def initialize(file_path:)
    @file_name = "#{file_path}.csv"
  end

  def call
    create_file
    state_links

    pry binding
  end

  def create_file
    ::CSV.open(@file_name, "wb") do |csv|
      csv << COLUMNS
    end
  end

  def state_links
     @state_links ||= Coldwellbankerhomes::StatesParser.new.call
  end

end