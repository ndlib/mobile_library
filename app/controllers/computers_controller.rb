class ComputersController < ApplicationController
  require 'open-uri'

  def index

    @statjs = open("http://clstats.cc.nd.edu/public/data.jsp").read

    @time = Time.now

  end
end
