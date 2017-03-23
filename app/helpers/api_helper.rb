require 'httparty'
require 'json'

helpers do

  def todays_bills
    memo = []
    offset = 0
    until offset == 60
      res = HTTParty.get("https://api.propublica.org/congress/v1/115/house/bills/introduced.json?offset=#{offset}", headers: {"X-API-Key" => ENV['PROPUB_KEY']})
      res["results"][0]["bills"].each do |bill|
        bill_data = HTTParty.get(bill["bill_uri"], headers: {"X-API-Key" => ENV['PROPUB_KEY']})
        memo << bill_data["results"][0]
      end
      offset += 20
    end
    memo
  end

end
