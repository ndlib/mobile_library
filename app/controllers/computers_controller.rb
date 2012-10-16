class ComputersController < ApplicationController

  def index

    Savon.configure do |c|
      c.env_namespace = :soap
      c.pretty_print_xml = false
    end


    client = Savon::Client.new do
      wsdl.document = "http://labstats1-prod.cc.nd.edu/WebServices/Statistics.asmx?WSDL"
      wsdl.namespace = "http://m.library.nd.edu"
      wsdl.element_form_default = :unqualified
    end

    client.wsse.created_at = Time.now
    client.wsse.expires_at = Time.now + 60

    response = client.request :get_grouped_current_stats do
    soap.element_form_default = :unqualified
      soap.body = {"GetGroupedCurrentStatsResult" => {"GroupStat" => { "groupId" => "28" } } }
    end

    doc = Nokogiri::XML(response.to_xml)
    doc.remove_namespaces!

    @stats = Hash.new {|hash, key| hash[key] = Hash.new}

    doc.xpath("//GroupStat").each do |group_stat|

      group_id = group_stat.xpath('.//groupId').text
      puts group_id

      in_use_count = group_stat.xpath('.//inUseCount').text
      puts in_use_count

      available_count = group_stat.xpath('.//availableCount').text
      puts available_count

      off_count = group_stat.xpath('.//offCount').text
      puts off_count

      total_count = group_stat.xpath('.//totalCount').text
      puts total_count

      @stats[group_id] = { 'in_use_count' => in_use_count, 'available_count' => available_count, 'off_count' => off_count, 'total_count' => total_count }

    end


    @time = Time.now

  end
end
