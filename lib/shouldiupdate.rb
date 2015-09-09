def bundle_outdated

  `bundle outdated`.lines.reduce([]) do |out, line|
    res = line.match /\* (.*) \(newest (.*), installed (.*), requested = (.*)\) in group/
    res ||= line.match /\* (.*) \(newest (.*), installed (.*), requested = (.*)\)/
    res ||= line.match /\* (.*) \(newest (.*), installed (.*)\) in group/
    res ||= line.match /\* (.*) \(newest (.*), installed (.*)\)/

    if res
      name,newest,installed, requested = res[1], res[2], res[3], res[4]
      gem = { name: name, newest: newest, installed: installed }
      gem[:requested] = requested if requested
      out << gem
    end

    out
  end
end

def filter_outdated_gems
  bundle_outdated.select do |gem|
    yield Gem::Version.new(gem[:newest]), Gem::Version.new(gem[:installed])
  end
end

def should_i_update
  gems = filter_outdated_gems { |newest, installed| installed.bump <= newest }

  if gems.empty?
    puts green "Your Gemfile looks good :)"
  else
    puts red "Your Gemfile could do with some updating :("
    gems.each do |gem|
      puts "    #{gem[:name]} (newest #{gem[:newest]}, installed #{gem[:installed]})"
    end
  end
  puts ""

  !gems.empty?
end

def red str
  "\e[31m#{str}\e[0m"
end

def green str
  "\e[32m#{str}\e[0m"
end

