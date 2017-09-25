unset RAILS_SERVE_STATIC_FILES; 
export RAILS_ENV=development; 

bundle exec rake assets:clobber

rails s