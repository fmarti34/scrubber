require "./scrubber"

begin
  if ARGV.length != 2
    puts "Error: Expected 2 arguments but received #{ARGV.length}"
    puts "Example: ruby scrub.rb sensitive_fields.txt input.json"
  else
    sensitive_fields_file = ARGV[0]
    input_file = ARGV[1]
    scrubber = Scrubber.new(sensitive_fields_file, input_file)

    puts JSON.pretty_generate(scrubber.scrub)
  end
rescue ArgumentError => e
  puts "Error: #{e.message}"
  exit 1
end
