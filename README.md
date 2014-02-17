# Feedchirp

Feedchirp is a Ruby on Rails app that checks for new entries in your RSS feeds
and tweets the new ones at you.

Use it live at [https://feedchirp.herokuapp.com](https://feedchirp.herokuapp.com)

Based on [PurpleWho's idea](http://www.reddit.com/r/SomebodyMakeThis/comments/1vv80z/a_twitter_rss_reader/) on Reddit.

Most of the interesting stuff is in the 2 worker classes:

`app/workers/feed_updater.rb`
`app/workers/tweeter.rb`

## Configuration

If you want to run your own copy of this app, you'll need to set the following environment varialbles:

* CLIENT_ACCESS_SECRET
* CLIENT_ACCESS_TOKEN
* CLIENT_CONSUMER_KEY
* CLIENT_CONSUMER_SECRET
* CONSUMER_KEY
* CONSUMER_SECRET
* DATABASE_URL
* REDISTOGO_URL
* SECRET_KEY_BASE
* SIDEKIQ_PASSWORD
* SIDEKIQ_USERNAME

## Dependencies

Feedchirp assumes you're using PostgreSQL and Redis

## Testing

This was a big spike, so there are no tests. I know. I'm a bad person :(

I won't add any new features without tests. If you'd like to contribute to this project, testing would be a great place to start.