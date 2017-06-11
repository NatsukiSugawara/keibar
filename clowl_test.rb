# coding: utf-8

require 'open-uri'
require 'open_uri_redirections'
require 'nokogiri'


doc = Nokogiri::HTML(open('http://race.netkeiba.com/', :allow_redirections => :safe))

doc.css('a').each do |element|
	# puts element[:href]
	# puts element[:title]

end

doc.xpath('//td').each do |e|
	# puts e.text
end


doc.xpath('//a').each do |e|
	puts e.text
end
