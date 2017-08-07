<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%-- response.setIntHeader("Refresh", 3); --%><!-- refresh the page after 3 seconds. -->
<!-- 
<div class="well" id="chat" style="overflow-y: auto; overflow-x: hidden; height: auto;">
	<div class="col-md-12 " style="height: 400px;">
		<div class="row " id="Msg">

							
		</div>
	</div>
</div>

 -->
<div class="well" id="chat" style="overflow-y: auto; overflow-x: hidden; height: auto;">
	<div class="col-md-12" style="height: 400px;">
		<div class="row">
			<c:forEach var="result" items="${messageList}">
				<c:choose>
					<c:when test="${result.senderId == myId}">
						<div class="row">
							<div class="col-md-6"></div>
							<div class="col-md-6">
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
							<div class="col-md-6">
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

