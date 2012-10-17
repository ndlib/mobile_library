class ComputersController < ApplicationController

  def index

    client = Savon::Client.new do
      wsdl.document = "http://labstats1-prod.cc.nd.edu/WebServices/Statistics.asmx?WSDL"
      wsdl.namespace = "http://m.library.nd.edu"
    end

    client.wsse.created_at = Time.now
    client.wsse.expires_at = Time.now + 60

    response = client.request :get_grouped_current_stats do
      soap.element_form_default = :unqualified
    end

    doc = Nokogiri::XML(response.to_xml)
    # Makes life a lot easier to remove...
    doc.remove_namespaces!

    # storing stats as hash within hash
    @stats = Hash.new {|hash, key| hash[key] = Hash.new}

    doc.xpath("//GroupStat").each do |group_stat|

      group_id = group_stat.xpath('.//groupId').text

      in_use_count = group_stat.xpath('.//inUseCount').text

      available_count = group_stat.xpath('.//availableCount').text

      off_count = group_stat.xpath('.//offCount').text

      total_count = group_stat.xpath('.//totalCount').text

      @stats[group_id] = { 'in_use_count' => in_use_count, 'available_count' => available_count, 'off_count' => off_count, 'total_count' => total_count }

    end


    @time = Time.now

  end
end
