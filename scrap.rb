require 'csv'

# data = File.new('1912.csv')
# parsed_data = data.to_a.join()
# csv_data = (CSV.new(parsed_data, :headers => true, :header_converters => :symbol)).to_a.map {|row| row.to_hash}
all = []

haha = [1..3237]

CSV.foreach("fips.csv") do |row|

  join = row[0] + row[1]
  join.to_i
  
  fips << join
    # row.to_a.map {|row| row.to_hash }
end

CSV.foreach("1912.csv") do |row|



end

CSV.open("2012mod.csv", "wb") do |csv|
  csv << ["statecounty", "hex_color"]
  all.each do |row|
    csv << row
  end
end
