class EventsController < ApplicationController
  #layout false
  #layout Proc.new { |controller| controller.request.xhr? ? false : "application" }

  layout proc{ |c| c.request.xhr? ? false : "application" }

  require 'rubygems'
  require 'open-uri'
  require 'nokogiri'


  def index

    @items = []

    eventsxml = open("http://www.library.nd.edu/events/feed/", "User-Agent" => "Ruby-OpenURI", "Referer" => "http://m.library.nd.edu/")
    doc = Nokogiri::XML(eventsxml)

    doc.xpath("//item").each do |item|

      title = item.xpath('.//title').text
      puts title

      post = item.xpath('.//content:encoded').text
      puts post

      @items << {'title' => title, 'post' => post}

    end


  end

end
