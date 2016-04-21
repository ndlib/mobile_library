class RenalertsController < ApplicationController
  require "rubygems"
  require "open-uri"

  def index
    @renalerts = open(
      "http://us9.campaign-archive2.com/generate-js/?u=3e737e755493a925f88711b17&fid=8753&show=3",
      "User-Agent" => "Ruby-OpenURI",
      "Referer" => "http://m.library.nd.edu/"
    ).read.to_s
    @renalerts.gsub!(/document\.write\(\"/, "")
    @renalerts.gsub!(/\"\)/, "")
    @renalerts.delete! "\\"
    @renalerts.delete! ";"
  end
end
