require_relative 'base_class'

# Initializes a Weather instance by opening the specified weather data file.
# @param file_path [String] the path to the weather data file. Defaults to './w_data.dat'.
# @raise [Errno::ENOENT] if the file does not exist and it's handled by rescue clause.
class Weather < BaseClass
    FILE_START_LINE = 7
    def initialize(file_path = './w_data.dat')
        super(file_path)
    end

    def find_smallest
        min_temperature = Float::INFINITY
        day_with_min_temperature = nil

        IO.foreach(@file_path).with_index do |line, index|
            next if index < FILE_START_LINE
            next if line.start_with?('</pre>')

            line_values = line.split
            next if line_values[0]&.eql?('mo')

            temperature = line_values[2]&.gsub('*', '')&.to_i
            next unless temperature && temperature < min_temperature

            min_temperature = temperature
            day_with_min_temperature = line_values[0]
        end
        
        if day_with_min_temperature
            { day_number: day_with_min_temperature, small_temperature: min_temperature }
        else
            raise "There aren't any valid temperature values in the file: #{@file_path}"
        end
    rescue => e
        puts "Error: #{e.message}"
    end
end

weather = Weather.new
puts weather.find_smallest
