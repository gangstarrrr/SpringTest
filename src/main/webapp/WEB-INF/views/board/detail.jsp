<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>글내용</title>
<meta charset="UTF-8">
<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
	
		$(document).ready(function(){
			var boardNo="${param.boardNo}";	
			
			if(boardNo ==""){
				alert("누구");
				location.href="/SpringTest";
			}else{
			
				$.ajax({
					type:"post",
					url:"bld",
					data:{"boardNo":boardNo}
				}).done(function(data){
					var d = JSON.parse(data);
					var boardData=d.boardData;
					var filesData=d.filesData;
					boardHTML(boardData);
					filesHTML(filesData);
				});
			}
		});
		
		function boardHTML(data){
			console.log("boardHTML",data);
			var title = data.boardTitle;
			var contents = data.boardContents;
			$("#title").text(title);
			$("#contents").text(contents);
		}
		function filesHTML(data){
			console.log("filesHTML",data);
			$("#files").empty();
			for(var i =0; i<data.length;i++){
				var fileURL=data[i].fileURL;
				var html="<img src='"+fileURL+"'><br>";
				$("#files").append(html);
			}
			
		}
		</script>	

</head>
<body>

<!--
<%
	String boardNo = request.getParameter("boardNo");
%>
<%=boardNo %><br>				* 방법1
${param.boardNo} <br>			* 방법2
${paramValues.boardNo[0]}<br>	* 방법3
  -->
	<h1 id="title"></h1>
	<p id="contents"></p>
	<div id="files"></div>
	<div>
		<a href="bList">목록</a>
		<a href="bUpdate?boardNo=${param.boardNo}">수정</a>
		<a href="">삭제</a>
	</div>
</body>
</html>