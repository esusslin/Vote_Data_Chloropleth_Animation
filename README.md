# Vote_Data_Chloropleth_Animation

This project aims to provide a visual representation of the evolution of regional political party identity in the United States over the past 100 years.  The dataset used for this project is the comprehensive voting data - per county - of all U.S. Presidential Elections from 1912-2012.


## The Story

After independently researching D3.js in early 2016 we both decided we'd like to explore the visualization of comprehensive voting data in the United States - should we be able to get our hands on it.  

We were interested in the "red state" vs. "blue state" dichotomy in modern political discourse.  While these distinct regions seem so reliable during a single election season, the regional identity of political party affiliation in the United States has evolved dramatically over time.

In October 2016 we meticulously gathered our data set and visualized 100 years of voting data in U.S. Presidential Elections from 1912-2012.

## The Data

After a lot of independent research we found that the best public resource for comprehensive voting data in the United States was [Dave Leip's Atlas of U.S. Presidential Elections](http://uselectionatlas.org).  Mr. Leip's data collection is unrivaled and instrumental for this project.  With a membership to Mr. Leip's site we were able to access and compile the voting data we needed. 

We used [Selenium Webdriver](http://www.seleniumhq.org/projects/webdriver) to pull the voting data for each county (there are over 3,100 counties in the U.S.) for each election year from 1912-2012.  Altogether we had to scrape this data from some 80,000+ URLs.


## Mapping the Data in Color

We had originally intended to visualize the evolution of "red" vs. "blue" areas of the U.S. but right away we realized we had an issue: 3rd Party candidates.  To properly represent the impact of 3rd Party Candidates we decided to use the percentages of the Republican, Democrat, and the collective 'other' candidates to create a single color to represent a given county for a given election year.  Since red, green and blue constitute the triangular parents of all color in the RGB scale we allocated the collective 'other' percentages to the color green.

To achieve a single color representation for a given county on a given election year we shot the 'red', 'blue' and 'other' voting percentages through the following code to convert 'color' of each county to a single hexidecimal code.

```ruby
csv_data.each do |row|
  rgb = [row[:republican], row[:other], row[:democrat]].map do |candidate|
      (candidate.to_f * 2.55).to_i
  end
  num_as_hex = ""
  rgb.each do |component|
    hex = component.to_s(16)
    if component < 16
      num_as_hex << "0#{hex}"
    else
      num_as_hex << hex
    end
    row[:hex_color] = num_as_hex
  end
  puts row[:hex_color]
end
```



## Contributors

Contributors:
[Ronu Ghoshal](https://github.com/RonuGhoshal)
[Emmet Susslin](https://github.com/esusslin)

Data Source: [Dave Leip's Atlas of U.S. Presidential Elections](http://uselectionatlas.org)

## License

A short snippet describing the license (MIT, Apache, etc.)