# YouTube Live Caption [Experimental]

Phoenix live view project that allow any YouTube streamer to embed closed captions dynamically.

## Motivation

My contribution to the Elixir community. It was an opportunity to help #ElixirBrasil 2020 conference and future conferences.

## Run

Start your Phoenix server:

* Install dependencies with `mix deps.get`
* Install Node.js dependencies with `npm install` inside the `assets` directory
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

* Enable the closed caption option in your stream [YouTube Help](https://support.google.com/youtube/answer/3068031?hl=en)
* Past in the url field your closed caption URL
* Enjoy

## Troubleshoot

Sometimes when the connection hangs or when you refresh the page the socket miss your sequential caption number, so you need to manually set from where it stopped or any number higher than the previous. You can do this by setting a query param in the url `http://localhost:4000?seq=1000`

## DEMO

You can check the demo page to see and use the application live in your browser.
[Demo](https://youtube-live-caption-rmdlr.ondigitalocean.app)

## Notes

This project is highly experimental and has a lot of improvements to be made. Feel free to fork the repository and add new features and tests as you want. This project is from the community and for the community.
