<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

 $("#b01").click(function(){
////////////////////////////
var data={};
  data.pageSize=7;
  data.pageNum=1;
  //data.queryInfo={};
  //var queryInfo={};
  data.department="文";
  
  //data.queryInfo=queryInfo;
$.ajax({ 
 url: "/ssm/supervisorInfo/listSupervisor",
 data: data,
 type:"post",
 success: function(){
      alert(123);
      }});




///////////////////////////////////



  });


});
</script>
</head>
<body>


<button id="b01" type="button">post</button>

</body>
</html>