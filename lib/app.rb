require 'csv'

def parse_most_pages(log_file)
  final_hash = {}
  CSV.foreach(log_file) do |visit|
    page_visit = visit[0]
    page = page_visit.split.first
    ip = page_visit.split.last
    if final_hash.key?(page)
      final_hash[page] << ip
    else
      final_hash[page] = [ip]
    end
  end
  final_hash.each { |key, value| final_hash[key] = value.size }
  final_hash.sort_by { |_, value| -value }.to_h
end

def parse_most_unique(log_file)
  final_hash = {}
  CSV.foreach(log_file) do |visit|
    page_visit = visit[0]
    page = page_visit.split.first
    ip = page_visit.split.last
    if final_hash.key?(page)
      final_hash[page] << ip unless final_hash[page].include?(ip)
    else
      final_hash[page] = [ip]
    end
  end
  final_hash.each { |key, value| final_hash[key] = value.size }
  final_hash.sort_by { |_, value| -value }.to_h
end

p parse_most_pages('lib/webserver.log')
p parse_most_unique('lib/webserver.log')
