require_relative 'base_class'
class SoccerPremierLeague < BaseClass
    FILE_START_LINE = 3
    def initialize(file_path = './soccer.dat')
        super(file_path)
    end

    def find_smallest
        min_difference = Float::INFINITY
        team_with_min_difference = ''

        IO.foreach(@file_path).with_index do |line, index|
            next if index < FILE_START_LINE
            next if line.start_with?('</pre>')

            line_values = line.split
            f_column, a_column = line_values[6]&.to_i, line_values[8]&.to_i
            difference = f_column - a_column if f_column && a_column
            next unless difference && difference < min_difference

            min_difference = difference
            team_with_min_difference = line_values[1]
        end

        if team_with_min_difference
            { team_name: team_with_min_difference, small_difference: min_difference }
        else
            raise "There aren't any valid difference values in the file: #{@file_path}"
        end
    rescue => e
        puts "Error: #{e.message}"
    end
end

spl_class = SoccerPremierLeague.new
puts spl_class.find_smallest