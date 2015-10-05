## Installation

1. $ git clone git@github.com:irahulsingh/search-retailer.git
2. $ cd serach-retailer
3. $ bundle
4. $ rake db:create
5. $ rake db:migrate
6. $ rake db:seed
7. $ rails s

## Test

1. $ rake db:test:prepare
2. $ rspec

## Usage

1. allow browser to detect you current location
2. visit /retailers/new
3. create few retailer record near to you (don't care about latitude and longitude, it will automatically get populated using geocoder gem)
3. go to root path 
4. select radius
5. click search