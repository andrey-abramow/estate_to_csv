desc 'Estate scrabber'

task scrab_estates: :environment do
  Coldwellbankerhomes::Scrabber.file_name = 'real_estate.csv'
  Coldwellbankerhomes::Scrabber.new.call
end