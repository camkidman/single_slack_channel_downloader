### My use case

I needed to download all of the messages from a single channel, not something that Slack supports by nature. So I wrote this!

### Usage

`ruby slack_download_script.rb [slack_url] [auth_token] [channel_id]`

`slack_url` will end up being something like `https://myslackgroup.slack.com/api`

You can get an auth_token from https://api.slack.com/web

You'll also have to do some work to find the channel_id. Right now you can do this:

1. Go to a service like https://www.hurl.it
2. For the URL, use your slack_url with "/channels.list" on the end
3. Make sure to include your auth token in the request

That should give you enough information to find the `channel_id` for use.

### Results

This outputs all of the messages with the user that posted it in a JSON file in the same directory. LMK if you have any questions.
