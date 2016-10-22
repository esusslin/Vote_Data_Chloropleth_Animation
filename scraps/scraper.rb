require 'HTTParty'
require 'Nokogiri'
require 'logger'
require 'json'
require 'pry'
require 'csv'
require 'open-uri'
require 'mechanize'
require 'selenium-webdriver'

ary = []

CSV.foreach("1992copy.csv") do |row|

	# join = row[0] + row[1]
	 p row[0]
	# p row[1]
	# p row[2]
	# p row[3]
	p row[4]
	p row[5]
	# p row[6]
	# p row[7]
	# p row[8]
	# p row[9]

	each = []
	
	num = row[4].to_f - row[5].to_f

	p num

	each << row[0]
	each << num

	ary << each
	
end


# CSV.open("1992%.csv", "wb") do |csv|
#   ary.each do |this|
#    csv << this
#   end
# end

