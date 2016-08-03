# Webhooks & Websockets

## Learning Objectives

* Learn about and use webhooks
* Learn about and use websockets
* Learn about and use outside services in a Rails app
* Solidify HTTP responses and requests
* Solidify file uploads
* Learn about image processing

## Deliverables

* A working API hosted on heroku (CORS-enabled)
* A GitHub repo holding the code for said API
* A link to your frontend partner(s)'s interface for the app in the website field for the API
* Said repo submitted to TIYO

## Requirements

### Explorer Mode

* A Rails 5 API hosted on heroku
  `https://salty-temple-56361.herokuapp.com/`

* One model: Photo. At least three endpoints: One for listing all photos, one for creating a photo and one for showing a specific photo.
  * Accidentally set up as Posts Model.
  * Endpoint for all photos: `GET /posts`
  * Endpoint for creating a photo: `POST /email_processor`
  * Endpoint for showing a specific photo: `GET /posts/:id`

* Using Griddler, set up an email endpoint for users to email in photos - the photo is an email attachment and the subject becomes the photo caption.
  * Griddler Endpoint: `POST '/email_processor' => 'griddler/emails#create'`

* Said photos should be stored in your app using refile or similar.
* Using Pusher, send a websocket notification to subscribed users with the new photo.
* Your API and pusher notification should include a link to the image (so the FEE folks can display it on page) and a caption.
* Work with your frontend partner(s) closely to make sure they have what they need.

## Procedural Checklist

* Generate Rails app using --api --database:postgresql

* Uncomment `gem 'rack-cors'` to provide support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications.
  * See https://github.com/cyu/rack-cors for instructions on how to install the gem.
  * Update `initializer/cors.rb` file. Delete example.com and replace with splat
  * $ `bundle`

* Add `gem 'figaro'` to securely configure the Rails application.
  * $ `bundle`
  * Once your Pusher account is set-up, see https://github.com/laserlemon/figaro for instructions on how to update your Rails app.

* Add `gem 'griddler'` and `gem 'griddler-sendgrid'` to provide an endpoint for services that convert incoming emails to HTTP POST requests.
  * $ `bundle`
  * See https://github.com/thoughtbot/griddler for instructions on how to install the gem.
  * Under Tutorials, click on the link for the tutorial on SendGrid. Follow the tutorial.

* Login to SendGrid. If you do not have a SendGrid account, create one.
  * In Dashboard, select Settings > Inbound parse
  * Click Add Host & Url button
    * For Hostname, input your SendGrid username followed by bymail.in (need to ask Chris where this comes from).
    * For the url, input the url you plan to use for the API (i.e. Heroku, ngrok, localhost) followed by /email_processor.
    * Emails can now be sent to anything@username.bymail.in through SendGrid.
    * Note: remember to change the host & url if you change your API host.

* Add `gem 'active_model_serializers', '~> 0.10.0'`
  * $ `bundle`
  * Create Post serializer
  * See https://github.com/rails-api/active_model_serializers for information on serializers.

* Add `gem 'pusher'` to add security configurations for websockets.
 * $ `bundle`
 * See https://github.com/pusher/pusher-http-ruby for instructions.
 * After setting up a Pusher account, create a new app.
 * Using the configuration information in the app, refer to the Figaro README file for set-up instructions.

* Add `gem 'kramdown'` for editing markdown files
  * `bundle`

* In Rails 5, add the following gemfiles for refile, a modern file upload library for Ruby applications:
  * `gem "rack-protection", :github => "sinatra/rack-protection"`
  * `gem 'refile', github: 'refile/refile', require: 'refile/rails'`
  * `gem 'refile-mini_magick', github: 'refile/refile-mini_magick'`
  * `gem 'sinatra', github: 'sinatra/sinatra', branch: 'master'`
  * `gem 'refile-postgres', '~> 1.4'`
  * $ `bundle`
  * Follow the gem refile instructions at https://github.com/refile/refile.
