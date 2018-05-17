desc 'Estate scrabber'

task :coldwellbankerhomes_homes_to_csv, [:file_name] => [:environment] do |_task, args|
  Coldwellbankerhomes::Scrabber.file_name = args.file_name || 'real_estate.csv'
  Coldwellbankerhomes::Scrabber.new.call
end