desc 'Estate scrabber'

task scrab_estates: :environment do
  RealEstateScrabberWorker.perform_async
end