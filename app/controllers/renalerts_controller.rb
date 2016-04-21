class RenalertsController < ApplicationController
  require "rubygems"
  require "open-uri"
  require "nokogiri"

  def index
    @renalerts = open(
      "http://us9.campaign-archive2.com/generate-js/?u=3e737e755493a925f88711b17&fid=8753&show=3",
      "User-Agent" => "Ruby-OpenURI",
      "Referer" => "http://m.library.nd.edu/"
    ).read
  end
end
