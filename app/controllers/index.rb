get '/' do
  @bills = todays_bills
  erb :index
end
