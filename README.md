# Project LikeEventBrite


>Created on 18/08/2019 by Gaspard Tertrais.



**Note aux correcteurs**

My program is complete

To test the program please run :
bundle install
rails db:create
rails db:migrate
(rails db:seed)
rails server

Then, open your navigator and go to "http://localhost:3000/"



## Content



- **db/seed** : Test and explaination
- **db/migrate**: All the migrations
- **app/models** : All the models
- **app/helpers** : All the helpers
- **app/views** : All the views
- **Gemfile, Gemfile.lock** : Gem and dependencies. See below.





## Gemfile



```



source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'faker'
gem 'table_print'
gem 'bcrypt', '~> 3.1.7'


gem 'rails', '~> 5.2.3'

gem 'sqlite3'


gem 'uglifier', '>= 1.3.0'
