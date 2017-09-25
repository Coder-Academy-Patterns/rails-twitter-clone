export RAILS_SERVE_STATIC_FILES=1; 
export RAILS_ENV=production; 
export SECRET_KEY_BASE=set_this_to_something;

bundle exec rake assets:clobber
bundle exec rake assets:precompile

rails s