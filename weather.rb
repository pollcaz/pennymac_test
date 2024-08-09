class Weather
    def initialize
        @file = File.open('./w_data.dat', 'r')
    end
    def find_smallest_temperature
        min_temperature = Float::INFINITY
        day_with_min_temperature = nil

        raise 'File not found' unless @file

        @file.each_line.with_index(6) do |line, index|
            next if line.start_with?('</pre>')
            line_values = line.split
            temperature = line_values[2]&.gsub('*', '')&.to_i
            next unless temperature && temperature < min_temperature

            min_temperature = temperature
            day_with_min_temperature = line_values[0]
        end
        
        small_weather = { day_number: day_with_min_temperature, small_temperature: min_temperature }
        puts small_weather
    end
end 