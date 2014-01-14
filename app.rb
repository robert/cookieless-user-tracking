require 'sinatra'
require 'rack/cache'
require 'securerandom'

get '/' do
  'Your tracking id is <span id="trackingId"></span>. Try refreshing the page.
  Looks like you\'ve been tagged, even without cookies.
  <br/>
  <br/>
  <a href="http://robertheaton.com">Read my blog post explaining how</a>

  <script type="text/javascript" src="/tracking_token.js"></script>
  <script type="text/javascript">
    document.getElementById("trackingId").innerHTML = trackingId
  </script>'
end

get '/tracking_token.js' do
  cache_control :private
  last_modified Time.at(0)
  response['Content-Type'] = 'text/javascript'

  "var trackingId = '#{SecureRandom.uuid}';"
end
