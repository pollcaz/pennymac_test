Developer Challenge

1. In the attached file (w_data.dat), you’ll find daily weather data. Download this text file, then write a program to output the day number (column one) with the smallest temperature spread (the maximum temperature is the second column, the minimum the third column).
   ### The solution is in the class Weather and you can check it in the console
   #### loading the class:$ require './weather'
   #### Create a Weather Instance:$ weather_class = Weather.new
   #### Check the small temperature result:$ weather_class.find_smallest_temperature

3. The attached soccer.dat file contains the results from the English Premier League. The columns labeled ‘F’ and ‘A’ contain the total number of goals scored for and against each team in that season (so Arsenal scored 79 goals against opponents, and had 36 goals scored against them). Write a program to print the name of the team with the smallest difference in ‘for’ and ‘against’ goals.
   ### The solution is in the class SoccerPremierLeague and you can check it in the console
   #### loading the class:$ require './soccer_premier_league'
   #### Create a Weather Instance:$ spl_class = SoccerPremierLeague.new
   #### Check the small difference result:$ spl_class.find_smallest_difference
