# Parses https://www.coldwellbankerhomes.com homes to csv file

| Street address         | state | county     | zip code  | price       | bedrooms | year built | photos | url to home | 
|----------------------- |-------|------------|---------- |-------------|----------|------------|--------|-------------| 
| 3838 Windom Place NW   | DC    | Washington | 20016     | $1,050,000  |   3      |   1925     | https://m.cbhomes.com/p/979/1000489182/c6BA562b4C594F9/main.jpg       |   https://www.coldwellbankerhomes.com/dc/washington/3838-windom-place-nw/pid_24878531/   |


# How to use

* bundle install

* bundle exec sidekiq --concurrency=10

* rake coldwellbankerhomes_homes_to_csv[file.csv]