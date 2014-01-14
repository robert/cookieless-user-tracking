require 'sinatra'
require 'rack/cache'
require 'securerandom'

get '/' do
  '<script type="text/javascript" src="/tracking_token.js"></script>
  <script type="text/javascript">
  alert("Your trackingId is " + trackingId);
  </script>
  Looks like you\'ve been tagged, even without cookies.
  <br/>
  <br/>
  <a href="http://robertheaton.com">Read my blog post explaining how</a>
  '
end

get '/tracking_token.js' do
  last_modified Time.at(0)
  response['Content-Type'] = 'text/javascript'

  "var trackingId = '#{SecureRandom.uuid}';"
end
