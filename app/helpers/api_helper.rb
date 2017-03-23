require 'httparty'
require 'json'

helpers do

  def todays_bills
    res = HTTParty.get("https://api.propublica.org/congress/v1/115/house/bills/introduced.json?offset=0", headers: {"X-API-Key" => ENV['PROPUB_KEY']})
    res["results"][0]["bills"].inject([]) do |memo, bill|
      bill_data = HTTParty.get(bill["bill_uri"], headers: {"X-API-Key" => ENV['PROPUB_KEY']})
      memo << bill_data["results"][0]
      memo
    end
  end

end
