<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
	<link href="resources/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	
</head>
<body>
<%@include file="test.jsp" %>
<h1>
	Welcome ${username} : ${id} 
</h1>
${message}
				<form action="searchfriend" method="post" model="user">
					<input type="text" placeholder="Friend Username" name="username" value=""  />
					<input type="submit" value="Search Friend" />
				</form>	
				
	<br>
	${added}
	${self}
	My username : ${myUsername}
	<br>
	<table>
	<c:forEach var="result" items="${searchList}">
				<tr class="info">
					<td>${result.name}</td>
					<td>${result.username}</td>
					<td>${result.id}</td>
					<td>
						<c:choose>
							<c:when test="${myUsername == result.name}">
								<input type = "button" value="You can not add yourself">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-success" value="Add Friend" onClick="addFriend(${result.id})">
							</c:otherwise>
						</c:choose> 
					</td>
				</tr>
			</c:forEach>
	</table>
	
	<br>
	<b><a href="${pageContext.request.contextPath}/logout">Logout</a></b> 


	<script type="text/javascript">
	
		function addFriend(id){
			
			location.href="${pageContext.request.contextPath}/"+id+"/addFriend"; 
		}
	</script>

</body>
</html>
