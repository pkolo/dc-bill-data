require 'httparty'
require 'json'

helpers do

  def todays_bills
    res = HTTParty.get("https://api.propublica.org/congress/v1/115/house/bills/introduced.json?offset=0", headers: {"X-API-Key" => ENV['PROPUB_KEY']})
    res["results"].to_s
  end

end
