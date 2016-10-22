require 'HTTParty'
require 'Nokogiri'
require 'logger'
require 'json'
require 'pry'
require 'csv'
require 'open-uri'
require 'mechanize'
require 'selenium-webdriver'

all = []
fips = []
years = ['1912','1916','1920','1924','1924','1928','1932','1936','1940', '1944', '1948', '1952', '1956', '1960', '1964', '1968', '1972', '1976', '1980', '1984', '1988', '1992', '1996', '2000', '2004', '2008', '2012']

lol = (years.length * 3200)

CSV.foreach("fips.csv") do |row|

	join = row[0] + row[1]
	join.to_i
	
	fips << join
  	# row.to_a.map {|row| row.to_hash }
end



driver = Selenium::WebDriver.for :firefox

page = driver.get('http://uselectionatlas.org/login.php')

# form = driver.find_element(:id, 'form')
percentages = []

username = driver.find_element(:name, "username")
username.send_keys('esusslin')
password = driver.find_element(:name, "password")
password.send_keys('SmxBZWpt3')

form = driver.find_element(:name, "submit")

page1 = form.click

if fips.length > 0

	fips.each do |fip|

		heads = []

		driver.get("http://uselectionatlas.org/RESULTS/data.php?fips=" + fip + "&year=1920&datatype=town&def=1&f=0&off=0&elect=0")

		# perks = driver.find_elements(:class, "rgt")
		# headerz = driver.find_elements(:class, "tablesorter-header-inner")
		# lolzer = driver.find_elements(:class, "tablesorter-header")

		lollerskates = driver.find_elements(:css, 'tfoot tr td')
		headerz = driver.find_elements(:class, "tablesorter-header-inner")

		lollerskates.each do |this|
			# p 'hello'
			# p this.text
		end

		

		headers = []
		percs = []

		# p percs.length
		# p headerz.length

		headerz.each do |this|
			if (this.text != " ") 
				headers << this.text
			else
			end
		end

		lollerskates.each do |this|
			
			percs << this.text

		end

		p percs
		p headers

		## GET THE LEFT-MOST % VALUE!

		ww = headers.index("Black-.")

		w = headers.index("Other")

		x = headers.index("%Margin")

		y = headers.index("Harding")

		z = headers.index("Cox")

		eval = "-" + percs[x]


		deuce = [] 
		# # deuce << year
		deuce << fip

		# if (headers.length < 5) && (percs[w] > percs[y]) && (percs[w] > percs[z])

		# 	wally = "W" + percs[w]
		# 	deuce << wally

		if (x != nil)

			deuce << percs[x]
		else 
			deuce << "-"
		end

		if (y != nil)

			deuce << percs[y]
		else 
			deuce << "-"
		end

		if (z != nil)
			deuce << percs[z]
		else 
			deuce << "-"
		end

		if (w != nil)
			deuce << percs[w]
		else 
			deuce << "-"
		end

		if (ww != nil)
			deuce << percs[ww]
		else 
			deuce << "-"
		end

		p deuce

		all << deuce

		p all.length

	end
end

CSV.open("1920.csv", "wb") do |csv|
  all.each do |this|
   csv << this
  end
end

# CSV.open("1996headers.csv", "wb") do |csv|
#   heads.each do |this|
#    csv << this
#   end
# end


