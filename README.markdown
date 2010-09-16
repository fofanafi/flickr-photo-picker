# Flickr Photo Picker

A rails app that allows you to pick photos from flickr. See it [here](flickr-photo-picker.heroku.com).

## Using the site

Click on 'New photo', then 'Pick by username'. After you enter a username and press enter, it will look as if nothing is happening (because it's an AJAX request and I need to add little 'Loading...' signs), but if you wait a little bit the page will update with user photos! Or with an error message if that user doesn't exist. I need to catch that exception.

## Structure

There's one `flickr_photos` controller built by scaffolding.  
Actions:
`index` - Shows the current photos in the database.  
new - Pick a new photo.  
`table` - See a table listing of the photos database. (Added a route to this in config/routes.rb)  
`new` - Pick a new photo to add.  
`create` - Saves a photo to the database. Called from 'new'.  
`pick_by_username` - Renders the flickr widget with user photos. Called from 'new'.

FlickrPhotosHelper contains helper view functions.  
Methods:  
`render_flickr_widget` - Displays the photos as rows of tiny squares.

## Todo

- Add 'loading' signs
- Catch the user doesn't exist exception.

## License

This project uses the MIT License.
