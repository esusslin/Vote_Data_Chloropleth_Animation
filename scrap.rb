# nums = [-99, -96, -92, -88, -84, -80, -76, -72, -68, -64, -60, -56, -52, -48,-44, -40, -36, -32, -28, -24, -20, -16, -12, -8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 99, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190]

# colors = ["rgb(0,0,255)", "rgb(5,0,250)", "rgb(10,0,245)", "rgb(15,0,240)", "rgb(25,0,230)", "rgb(30,0,225)", "rgb(35,0,220)", "rgb(40,0,215)", "rgb(45,0,210)", "rgb(50,0,205)", "rgb(55,0,200)", "rgb(60,0,190)", "rgb(65,0,185)", "rgb(70,0,180)", "rgb(75,0,175)", "rgb(80,0,170)", "rgb(85,0,165)", "rgb(90,0,160)", "rgb(95,0,155)", "rgb(100,0,150)", "rgb(105,0,145)", "rgb(110,0,140)", "rgb(115,0,135)", "rgb(120,0,130)", "rgb(125,0,125)", "rgb(130,0,120)", "rgb(135,0,115)", "rgb(145,0,110)", "rgb(150,0,105)", "rgb(155,0,100)", "rgb(160,0,95)", "rgb(165,0,90)", "rgb(170,0,85)", "rgb(175,0,80)", "rgb(180,0,75)", "rgb(185,0,70)", "rgb(190,0,65)", "rgb(195,0,60)", "rgb(200,0,55)", "rgb(205,0,50)", "rgb(210,0,45)", "rgb(215,0,40)", "rgb(220,0,35)", "rgb(225,0,30)", "rgb(230,0,25)", "rgb(235,0,20)", "rgb(240,0,15)", "rgb(245,0,10)", "rgb(250,0,5)", "rgb(255,0,0)","rgb(230,230,230)", "rgb(220,220,220)","rgb(210,210,210)","rgb(200,200,200)","rgb(190,190,190)","rgb(180,180,180)","rgb(170,170,170)","rgb(160,160,160)","rgb(150,150,150)","rgb(140,140,140)","rgb(130,130,130)" ]

# p nums.length
# p colors.length

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


# CSV.foreach("fips.csv") do |row|

# 	join = row[0] + row[1]
# 	join.to_i
	
# 	fips << join
#   	# row.to_a.map {|row| row.to_hash }
# endv


CSV.foreach("data48and68.csv") do |row|

	fips = []

	fips << row[0]
	fips << ("#" + row[1]).to_s
	fips << ("#" + row[2]).to_s

	all << fips

end


CSV.open("48_68.csv", "wb") do |csv|
  all.each do |this|
   csv << this
  end
end



