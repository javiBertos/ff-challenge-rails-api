# The FinanceFox Challenge
Uses an API that operates over a single resource.

Would be great if you can implement your own API based on the specifications you can find below (*feel free to do it in python, node, ruby*).

The app must be deployed somewhere (*heroku is the simplest option*) so we can play with it easily.

### Extra points:
- Tests

## API USAGE DOCUMENT
- Resource: posts
- Content-Type: application/json
- Required fields: title and content.
- Sample JSON body:
```
{
  "post": {
    "title": "Madrid",
    "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas et ultricies ante.",
    "lat": "40.41678",
    "long": "-3.70379",
    "image_url": "https://c2.staticflickr.com/2/1269/4670777817_d657cd9819_b.jpg"
  }
}
```

## API Requests
### list
```
  endpoint: /posts
  method: GET
  body : not needed
  response code: 200
```

### show
```
  endpoint: /posts/:id
  method: GET
  body : not needed
  response code: 200
```

### create
```
  endpoint: /posts
  method: Post
  body : json
  response code: 201
```

### update
```
  endpoint: /posts/:id
  method: PUT
  body : json
  response code: 204
```

### remove
```
  endpoint: /posts/:id
  method: DELETE
  body : not needed
  response code: 204
```

# Tasks
- [x] Create github repo
- [x] Build an API
- [x] Return list elements from own API
- [x] Return requested element from own API
- [x] Allow create new element on own API
- [x] Allow update element on own API
- [x] Allow remove element on own API
- [x] Validate title and content are required
- [x] Create API Heroku app
- [x] Deploy API to Heroku :link: https://ff-challenge-rails-api.herokuapp.com