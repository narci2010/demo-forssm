<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

 $("#b01").click(function(){

alert($("#test").val());


  });


});
</script>
</head>
<body>

<input id="test"></input>
<button id="b01" type="button">post</button>

</body>
</html>