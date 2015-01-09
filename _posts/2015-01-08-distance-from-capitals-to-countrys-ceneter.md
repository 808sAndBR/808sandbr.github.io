---
layout: post
title: "Distance from Countries' Geographic Centers to their Capitol Cities"
date: 2015-01-08
---
<p>
    I wanted to visualize the distance and direction that each country's capitol is from it's geographic center. I set each countries geographic center to 0 latitude, 0 longitude and plotted each capitol in it's relative latitudinal/longitudinal position (scale based on <a href = "http://en.wikipedia.org/wiki/Decimal_degrees"> decimal degrees</a>).
</p>
<iframe src="/dataVis/capitals/capitals-with-russia.html" width="1050" height="500" marginwidth="0" marginheight="0" frameBorder="0" seamless="seamless" scrolling="no"></iframe>

<p>
    Since Russia is a massive outlier I removed it for a clearer view of the rest of the world:
</p>

<iframe src="/dataVis/capitals/capitals.html" width="1050" height="500" marginwidth="0" marginheight="0" frameBorder="0" scrolling="no"></iframe>

<p>
    Then I couldn't stop wondering how countries would look compared to the rest of the countries on their continent. So I broke them out by continent (still with Russia removed):
</p>

<p>
    Americas:
</p>
<iframe src="/dataVis/capitals/americas.html" width="1050" height="500" marginwidth="0" marginheight="0" frameBorder="0" scrolling="no"></iframe>

<p>
    Europe:
</p>
<iframe src="/dataVis/capitals/europe.html" width="1050" height="500" marginwidth="0" marginheight="0" frameBorder="0" scrolling="no"></iframe>

<p>
    Asia:
</p>
<iframe src="/dataVis/capitals/asia.html" width="1050" height="500" marginwidth="0" marginheight="0" frameBorder="0" scrolling="no"></iframe>

<p>
    Africa:
</p>
<iframe src="/dataVis/capitals/africa.html" width="1050" height="500" marginwidth="0" marginheight="0" frameBorder="0" scrolling="no"></iframe>

<p>
    Oceania:
</p>
<iframe src="/dataVis/capitals/oceania.html" width="1050" height="500" marginwidth="0" marginheight="0" frameBorder="0" scrolling="no"></iframe>

<div class = "sources">
    Data Sources:<br>
    geographic centers: http://www.nationmaster.com/country-info/stats/Geography/Geographic-coordinates<br>
    capitol locations: https://github.com/icyrockcom/country-capitals/blob/master/data/country-list.csv<br>
    continent data: http://en.wikipedia.org/wiki/List_of_sovereign_states_and_dependent_territories_by_continent_%28data_file%29<br>
    capitol names: https://github.com/icyrockcom/country-capitals/blob/master/data/country-list.csv<br>
</div>
