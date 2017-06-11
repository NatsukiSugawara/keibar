require 'open-uri'
require 'open_uri_redirections'
require 'nokogiri'
require 'mechanize'
require 'pry'

class Crawler
  def self.search_page
    agent = Mechanize.new
    page = agent.get('http://db.netkeiba.com/?pid=race_search_detail')
    form = page.forms[1]
    form.fields[4].value = 2000 # start_year
    form.fields[5].value = 1    # start_mon
    form.fields[6].value = 2017 # end_year
    form.fields[7].value = 6    # end_mon
    form.checkboxes[10].click   # 競馬場

    agent.submit(form)
  end

  def self.crawl(page)
    hrefs = page.search("//div[@id='page']/div[@id='contents_liquid']/table/tr/td/a")
    links = []

    hrefs.each do |href|
      link.push(page.link_with(href: href.attributes['href'].value))
    end

    links.each do |link|
      page = link.click
    end
  end
end

page = Crawler.search_page
Crawler.crawl(page)
