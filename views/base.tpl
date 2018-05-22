<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
    <title>Catatan Anak Sekolah</title>
    <script type="text/javascript" src="/static/bower_components/jquery/dist/jquery.min.js"></script>
  <script type="text/javascript" src="/static/bower_components/moment/min/moment.min.js"></script>
  <script type="text/javascript" src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/static/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/static/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css"  media='print'>
<script type="text/javascript" src=" https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="/static/css/custom.css">

 </head>


<body id="home">

  {{.BaseHeader}}

  <div id="wrap">
      {{.LayoutContent}}
  </div>

  {{.BaseFooter}}


  {{range .HeadScripts}}
      <script src="{{.}}"></script>
  {{end}}

</body>
</html>
