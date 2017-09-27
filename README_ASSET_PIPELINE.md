Rails Asset Pipeline

What is the Asset Pipeline?
-----------------

The Rails Asset Pipeline is the name given to the way Rails applications manage Javascript and CSS assets.

In short, the main objective of the Asset Pipeline is to optimise JS/CSS into the most efficient form for delivery.

The main motivation for doing this is to reduce latency and cost in the production enironment.


Aside: the SASS gem
---------

Quick example of the SASS gem.
Follow commits in the `sass-gem` repo.

Sprockets
----------

The Rails Asset Pipeline is implemented by the `sprockets-rails` gem.

https://github.com/rails/sprockets-rails

Sprockets is a Ruby library that:

* compiles and serves web assets: JS and CSS

* provides a framework for dependency management

* allows use of higher-level coding languages like Coffeescript, SASS

* provides a robust cache busting method via fingerprinting


Features of the Asset Pipeline
-------------------

The three main features of the Asset Pipeline are:

1. Concatenate source code: reduces the number of request / response cycles to access JS and CSS

2. Minify / compress source code: reduce the size of response payloads

3. Compile higher-level languages: eg. Coffeescript => JS or SASS => CSS

4. Fingerprinting: when source code is changed, the names of built JS and CSS assets (plus `src`/`href` attributes in the layout) are updated to a new unique name


Assets: source and destination
--------------

Source locations:

```
app/assets
```

ie.

```
app/assets/images
app/assets/javascripts
app/assets/stylesheets
```

Destination

```
public/assets
```

The `config/initializers/assets.rb` is where this is currently configured.

Note that in future versions (`sprockets` version 4) it will be done in `assets/config/manifest.js` file.  


How asset compilation is done:
--------------

To compile the assets to `public/assets`, the command is run:

```
bundle exec rake assets:precompile
```

To delete compiled assets manually:
```
bundle exec rake assets:clobber
```


Getting practical
============

Add an image to our index page
-----------

Ensure this is located in the correct directory.

Use the `image_tag` helper.
Aside to action view helpers:
http://guides.rubyonrails.org/action_view_overview.html#assettaghelper


Run the server in development mode
----------------

```
rails s
```

Note the `<head>` tag has multiple `<script>` tags etc.
Asset pipeline isn't compiling resources!

Run the server in production mode
--------------
Create and edit the following in `./run-production.sh`

```
export RAILS_ENV=production; 
export RAILS_SERVE_STATIC_FILES=1; 
export SECRET_KEY_BASE=set_this_to_something;

bundle exec rake assets:clobber
bundle exec rake assets:precompile

rails s
```

Change the permissions to executable:
```
chmod a+x ./run-production.sh
```
Then, run it: 
```
./run-production.sh
```


Note the `<script>` tags in `<head>` are many fewer. 

Then, to return to development mode:


Create and edit the following in `./run-development.sh`

```
unset RAILS_SERVE_STATIC_FILES; 
export RAILS_ENV=development; 

bundle exec rake assets:clobber

rails s
```
Change the permissions to executable:
```
chmod a+x ./run-development.sh
```

Add sample CSS (maybe Javascript) to asset pipeline
--------------

Ensure these are located in the correct directory.


Run the server in development and production mode to notice the difference in the Javascript and CSS files.


ERB in CSS
-------

Use `<%= asset_path "image.png" %>` in `background-image` 

SCSS processing and supportive functions
--------
Rename `application.css` to `application.scss` 
Use `asset_path()` in CSS property, eg.
```
   background-image: url(asset_path("ca.png"));
```



Bootstrap
--------

Install and configure `sass-bootstrap` gem.
https://github.com/twbs/bootstrap-sass

Reference: 
https://getbootstrap.com/docs/3.3/

Glyphicons:
`glyphicon glyphicon-asterisk`

Customising: 
https://getbootstrap.com/docs/3.3/customize/

Rails themes
---------
Find a theme, may be based on bootstrap and install.

eg.
https://bootswatch.com/

Also:
https://dresssed.com/
http://bootswatchr.com/gallery
https://www.bootstrap-live-customizer.com/


`assets`, `lib` and `vendor` directories
----------

`assets` is for your code that is specific to this particular application.

`lib` is for your code that is common to several projects eg. utility libraries

`vendor` is for third-party code that is being imported eg. plugin code

Extension: Fonts in the asset pipeline
-----------

Discussion / example
A word on fonts: https://gist.github.com/anotheruiguy/7379570


Challenges
============

1. Add a company logo to the index page in the asset pipeline.

2. Test the server locally in production mode and see `public/assets`, differences in `<head>` tags

3. Add a set of icons to be used in the site in the asset pipeline and repeat step 2.

4. Add new CSS rules in the `assets` directory and repeat step 2.

5. Install and configure the `bootstrap-sass` gem.

6. Find a theme and install from bootswatch/dresssed otr other.



