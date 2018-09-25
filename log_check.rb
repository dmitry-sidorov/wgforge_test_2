log = File.open('./wgforge.wargaming.com_access.log'){ |file| file.read }
ips = log.split.select{ |item| item =~ /^\d+\.\d+\.\d+\.\d+$/ }
ips_hash = {}
ips.each do |ip|
  if ips_hash.include? ip
    ips_hash[ip] += 1
  else
    ips_hash[ip] = 1
  end
end
max = ips_hash.max_by { |ip, value| value }
ips_hash.delete(max[0])
puts max.to_s
new_max = ips_hash.max_by { |ip, value| value }
puts new_max.to_s
