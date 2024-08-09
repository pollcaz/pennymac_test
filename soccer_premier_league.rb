class SoccerPremierLeague
    def initialize
        @file = File.open('./soccer.dat', 'r')
    end

    def find_smallest_difference
        min_difference = Float::INFINITY
        team_with_min_difference = ''
        raise 'File not found' unless @file

        @file.each_line.with_index(3) do |line, index|
            next if line.start_with?('</pre>')

            line_values = line.split
            f_column, a_column = line_values[6]&.to_i, line_values[8]&.to_i
            difference = f_column - a_column if f_column && a_column
            next unless difference && difference < min_difference

            min_difference = difference
            team_with_min_difference = line_values[1]
        end

        small_difference = { team_name: team_with_min_difference, small_difference: min_difference }
        puts small_difference
    end

end