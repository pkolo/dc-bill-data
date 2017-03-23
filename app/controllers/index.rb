require 'httparty'
require 'json'

get '/' do
  @res = HTTParty.get("https://api.propublica.org/congress/v1/115/house/bills/introduced.json", headers: {"X-API-Key" => ENV['PROPUB_KEY']})
  @res["results"].to_s
end
