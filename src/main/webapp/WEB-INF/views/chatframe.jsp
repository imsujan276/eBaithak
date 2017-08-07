<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- refresh the page after 3 seconds. -->
<% response.setIntHeader("Refresh", 3); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<link href="resources/css/chat.css" type="text/css"
	rel="stylesheet" />
<link href="resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src ="resources/js/jquery.min.js"></script>
<script type="text/javascript" src ="resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src ="resources/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	$('#chat').scrollTop($('#chat')[0].scrollHeight);
}); 
	
</script>

</head>
<body>

	<div class="well" id="chat" style="overflow-y: auto; overflow-x: hidden; height: auto;">
		<div class="col-md-12 col-sm-12 col-xs-12" style="height: 400px;">
			<div class="row">
				<c:forEach var="result" items="${messageList}">
					<c:choose>
						<c:when test="${result.senderId == myId}">
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6"></div>
								<div class="col-md-6 col-sm-6 col-xs-6">
									<div class="alert alert-success" role="alert">
										
										<c:forEach var="users" items ="${allUserList}">
											<c:if test="${users.id == result.senderId}">
											
												<strong>${users.username}</strong><br>${result.message}
											
											</c:if>
										</c:forEach>
										
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<div class="alert alert-info" role="alert">
										
										<c:forEach var="users" items ="${allUserList}">
											<c:if test="${users.id == result.senderId}">
											
												<strong>${users.username}</strong><br>${result.message}
											
											</c:if>
										</c:forEach>
										
									</div>
								</div>
								<div class="col-md-6"></div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	
</body>
</html>