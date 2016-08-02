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
* One model: Photo. At least three endpoints: One for listing all photos, one for creating a photo and one for showing a specific photo.
* Using Griddler, set up an email endpoint for users to email in photos - the photo is an email attachment and the subject becomes the photo caption.
* Said photos should be stored in your app using refile or similar.
* Using Pusher, send a websocket notification to subscribed users with the new photo.
* Your API and pusher notification should include a link to the image (so the FEE folks can display it on page) and a caption.
* Work with your frontend partner(s) closely to make sure they have what they need.
