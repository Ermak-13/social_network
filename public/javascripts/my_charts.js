var buildChart = function(data) {
  new Highcharts.Chart({
    chart: {
      renderTo: "orders_chart"
    },
    title: {
      text: "The Number Of Users On Days"
    },
    xAxis: {
      type: "datetime"
    },
    yAxis: {
      title: {
        text: "the number of users"
      }
    },
    series: [{
      pointInterval: 24*60*1000*60,
      data: data 
    }]
  });
};

$(function(){
  $.getJSON("http://localhost:3000/admin/statistics", buildChart);
});