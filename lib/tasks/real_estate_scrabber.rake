desc 'Estate scrabber'

task scrab_estates: :environment do
  Coldwellbankerhomes::Scrabber.new(file_path: 'real_estate').call
end