<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("user"))
                userName = cookie.getValue();
        }
    }
    if(userName == null)
        response.sendRedirect("index.jsp");
%>

<h1>Which singer is using the most love words in their songs?</h1>

<div id="piechart"></div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
    // Load google charts
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    // Draw the chart and set the chart values
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Singer', 'Using love words precentage'],
            ['Eminem', 0.0373860586117],
            ['50-cent', 0.00190044198574],
            ['Britney Spears', 0.00295732681433],
            ['Coldplay', 0.00535261526904],
            ['Celine Dion', 0.00351073639837],
            ['Beyonce', 0.0566207502303]
        ]);

        // Optional; add a title and set the width and height of the chart
        var options = {'title':'Average love words usage', 'width':550, 'height':400};

        // Display the chart inside the <div> element with id="piechart"
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
    }
</script>
<p>To calculate these results, we analyzed:</p>
<p>118 of Beyonce's songs<br>
588 of Eminem's songs<br>
425 of 50-Cent's songs<br>
195 of Coldplay's songs<br>
551 of Celine Dion's songs<br>
And 422 of Britney Spears's songs</p>
<br>
<p>The stats above were calculated using <a href="">this</a> python script.</p>
<p>You can find this project in <a href="">GitHub</a>.
</body>
</html>