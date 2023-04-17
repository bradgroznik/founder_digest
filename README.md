# FounderDigest
a newsletter app. Learn how to use this at [24 Hour MVP](https://founderhacker.com/24-hour-mvp).


## Installation
1. clone the repo
2. `cd founder_digest && bin/setup`
3. cp config/application-sample.yml config/application.yml
4. get 'config/applications.yml' real values from repo admin

## Development
```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```

## Testing
```
bundle exec rspec # run all tests inside spec/
bundle exec rspec spec/dir_name # run all tests inside given directory
```

