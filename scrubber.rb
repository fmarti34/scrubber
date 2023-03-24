require 'json'

class Scrubber
  def initialize(sensitive_fields_file, input_file)
    check_file(sensitive_fields_file)
    check_file(input_file)

    @sensitive_fields = File.readlines(sensitive_fields_file).map(&:strip)
    @input_data = JSON.parse(File.read(input_file))
  end

  def scrub
    scrub_obj(@input_data).compact
  end

  private

  def check_file(filename)
    unless File.file?(filename)
      raise ArgumentError.new("file not found: #{filename}")
    end
  end

  def scrub_obj(obj)
    new_obj = {}

    obj.each do |key, value|
      if @sensitive_fields.include?(key)
        new_obj[key] = scrub_sensitive_field(value)
      elsif value.is_a?(Hash)
        new_obj[key] = scrub_obj(value)
      elsif value.is_a?(Array)
          new_obj[key] = scrub_array(value)
      else
        new_obj[key] = value
      end
    end

    new_obj
  end

  def scrub_array(arr)
    new_arr = []

    arr.each do |field|
      if field.is_a?(Hash)
        new_arr << scrub_obj(field)
      else
        new_arr << field
      end
    end

    new_arr
  end

  def scrub_sensitive_field(field)
    case field
    when String, Numeric
      field.to_s.gsub(/\w/, "*")
    when TrueClass, FalseClass
      "-"
    when Array
      field.map { |value| scrub_sensitive_field(value)}
    when Hash
      field.transform_values { |value| scrub_sensitive_field(value) }
    else
      field
    end
  end
end
