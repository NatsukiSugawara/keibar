# coding: utf-8

# coding: utf-8

require 'open-uri'
require 'open_uri_redirections'
require 'nokogiri'
require 'mechanize'
require 'pry'

agent = Mechanize.new
page = agent.get("http://db.netkeiba.com/?pid=race_search_detail")
form = page.forms[1]
form.fields[4].value = 2000
form.fields[6].value = 2017
form.fields[7].value = 6
form.checkboxes[10].click


p agent.submit(form)

page.xpath("//label").each do |element|
  puts element.text
end
puts page.forms


link = page.links



# pid:race_list
# word:
# start_year:2000
# start_mon:none
# end_year:2017
# end_mon:6
# jyo[]:08
# kyori_min:
# kyori_max:
# sort:date
# list:100
