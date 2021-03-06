#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @title
    xml.description @description
    xml.link request.original_url
    xml.language "en"

    @oeis_sequences.each do |seq|
      xml.item do
        xml.title "A#{seq["number"]}: #{seq["name"]}"
        xml.description seq["data"]
        xml.link "http://oeis.org/A#{seq["number"]}"
        xml.guid "http://oeis.org/A#{seq["number"]}"
        begin
          xml.pubDate(Date.parse(seq["author"][/\w{3} \d{2} \d{4}/]).rfc822)
        rescue StandardError => e
        end
      end
    end
  end
end
