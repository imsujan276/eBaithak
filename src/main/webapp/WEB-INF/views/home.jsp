<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>


<html>
<head>
<title>e-Baithak | Home | ${username}</title>
<link href="resources/css/chat.css" type="text/css"
	rel="stylesheet" />
<link href="resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src ="resources/js/jquery.min.js"></script>
<script type="text/javascript" src ="resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src ="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src ="resources/js/bootstrap-tooltip.js"></script>

<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
window.setTimeout(function() {
    $(".a").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 4000);
</script>

</head>

<body>

	<!-- start of the header -->
	<nav class="navbar navbar-default">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">
					e-Baithak - 
					<small>
						Real-Time Group Text and Video Communication
					</small>
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- end of the header -->


	<div class="container">
		<div class="row">
			<!-- Optional: clear the XS cols if their content doesn't match in height -->
			<div class="clearfix visible-xs-block"></div>

			<!-- left partition of the webpage -->
			
			<div class="col-xs-4 col-sm-2 col-md-2">
			
				<c:forEach var="result" items="${userDetail}">
					<img src="resources/userImg/${result.photo}" alt="profile" class="thumbnail" width="180px" height="180px">			
					
					<h3>${result.name}<small> (${result.username})</small></h3>
					
				</c:forEach>
				
				
				
				
				
					<!--  Includeing friends list and search friends -->
					<hr>

					<h4>Add Friend</h4>
	
					<form action="searchfriend" method="post" model="user">
							<div class="input-group">
								<input type="search" class="form-control" value="" name="username" placeholder="Username/Name">
							</div>
						</form>
					<%--
					<c:forEach var="result" items="${searchList}">
									<c:choose>
										<c:when test="${myUsername == result.name}">
											
										</c:when>
										<c:otherwise>
											<form action="addFriend" method="POST">
												
												<div class="alert alert-info alert-dismissible" role="alert">
  								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  									<span aria-hidden="true">&times;</span></button>	
												<table>
													<tr>
														<th><img src = "resources/userImg/${result.photo}" class="img-thumbnail" width="100px" height = "100px"></th>
													</tr>
													<tr>
														<th>&nbsp;&nbsp;&nbsp;${result.username}</th>
													</tr>
													<tr>
														<th><br>
															<input type="hidden" name="friendId" value="${result.id}">
															<input type="submit" class="btn btn-primary" value="+ Add Friend">
														</th>
													</tr>
												</table>					
												</div>
												
											</form>
										</c:otherwise>
									</c:choose> 
							</c:forEach>
	
					<hr>
				 --%>
				 
					<h4>Friends :</h4>
	
					<div class="col-md-12"id="" style="overflow-y:scroll; overflow-x:hidden; height:200px;">			
						
						<c:forEach var="result" items="${friendsList}">	
								<c:choose>
										<c:when test="${result.status == 0}">
											<p><img src = "resources/userImg/${result.photo}" width="40px" height = "40px"> ${result.name} (${result.username})</p>
										</c:when>
										<c:otherwise>
											<p style="color:blue"><img src = "resources/img/${result.photo}" width="40px"> ${result.name} (${result.username})</p>
										</c:otherwise>
									</c:choose> 	 
						</c:forEach>
						
					</div>

			</div>


			<!-- middle partition of the webpage -->
			<div class="col-xs-8 col-sm-10 col-md-10 container-fluid">
				<div class="col-lg-12">
					
									
					<!-------------------------------- Notification Area ------------------------------------->				
						<c:forEach var="result" items="${notifications}">
							<div class="a alert alert-success alert-dismissible" role="alert">
  								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  									<span aria-hidden="true">&times;</span></button>
  										${result.message} on <strong>${result.created_at}</strong>
							</div>
						</c:forEach>
					<!-------------------------------- Notification Area ------------------------------------->
					
					
					<!-------------------------------- Search Result Area ------------------------------------->
						<div class = "row">
						
							<c:forEach var="result" items="${searchList}">
									<c:choose>
										<c:when test="${username == result.username}">
											
										</c:when>
										<c:otherwise>
											<form action="addFriend" method="POST">
												
												<div class="alert alert-info alert-dismissible" role="alert">
  													<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  													<span aria-hidden="true">&times;</span></button>	
													<table>
														<tr>
															<td>
															<th><img src = "resources/userImg/${result.photo}" class="img-thumbnail" width="100px" height = "100px"></th>
															</td>
															<td>
															<th>
																&nbsp;&nbsp;${result.name}<br>
																&nbsp;&nbsp;${result.username}
															</th>
															</td>
														</tr>
														<tr>
															<td>
																<th><br>
																	<input type="hidden" name="friendId" value="${result.id}">
																	<input type="submit" class="btn btn-primary" value="+ Add Friend">
																</th>
															</td>
														</tr>
													</table>					
												</div>
												
											</form>
										</c:otherwise>
									</c:choose> 
							</c:forEach>
						</div>
					<!---------------------------------- Serach Result Area ------------------------------------->
					
					<!--  Includeing Search result for Adding Friends -->
				<%--	<h4>Search Results</h4>
						<div class="well" id="" style="overflow-y:scroll; overflow-x:hidden; height:140px;">
							
							<c:forEach var="result" items="${searchList}">
									<c:choose>
										<c:when test="${myUsername == result.name}">
											
										</c:when>
										<c:otherwise>
											<form action="addFriend" method="POST">
												<input type="hidden" name="friendId" value="${result.id}">
												
												<div class="alert alert-success" role="alert">	
													${result.name} (${result.username})											
													<input type="submit" class="btn btn-primary pull-right" value="+ Add Friend">
												</div>
												
											</form>
										</c:otherwise>
									</c:choose> 
							</c:forEach>	
						</div>
					
					<hr>
				 --%>
				 
					<!--  Includeing Notifications -->
				<%-- <h4>Notifications</h4>
						<div class="well" id="" style="overflow-y:scroll; overflow-x:hidden; height:140px;">
							
							<c:forEach var="result" items="${notifications}">
								<div class="alert alert-success" role="alert">			
									${result.message} on <b>${result.created_at}</b> 
								</div>
							</c:forEach>	
						</div>
					
					<hr>

					 --%>	
					 <hr>
					<h4>My Groups</h4>
					<div class="well" id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">
						<div class="col-md-12">
							<div class="row">
							
							
								<div class="col-md-3">
									
										<!-- trigger modal -->
										    <a href="" class="thumbnail" data-toggle="modal" data-target="#myModal"
										    	data-toggle="tooltip" data-placement="right" title="Create Baithak">
											  <img src="resources/img/gCreate.png">
											</a>

									
								</div>
								
								<c:forEach var="result" items="${baithakList}">	
										<form action="baithak" method="post">
											
										
												<div class="col-md-3">
													
														<img src="resources/baithakImg/${result.image}" class="thumbnail" 
																data-toggle="tooltip" data-placement="right" title="${result.discription}" 
																alt="GroupImage" width="150px" height="150px">
														<input type="hidden" name="userName" value="${username}">
														<input type="hidden" name="groupId" value="${result.id}">
													  	<input type="submit" class="btn btn-primary" value="${result.name}">
													
											</div>
										</form>
								</c:forEach>
							</div>
						</div>
					</div></div>
						
				<c:if test="${fn:length(groupList) > 0}">
				
				<h4> Groups I have Been Added</h4>
					<div class="well" id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">
						<div class="col-md-12">
							<div class="row">

								
								<c:forEach var="result" items="${groupList}">	
										<form action="baithak" method="post">
											<div class="col-md-3">
										
												<div class="col-md-3">
													<center>
														<img src="resources/baithakImg/${result.image}" class="thumbnail" 
																data-toggle="tooltip" data-placement="right" title="${result.discription}" alt="GroupImage" width="150px" height="150px">
														<input type="hidden" name="userName" value="${username}">
														<input type="hidden" name="groupId" value="${result.id}">
													  	<input type="submit" class="btn btn-primary" value="${result.name}">
													</center>
											</div>
										</form>
								</c:forEach>								
							</div>

						</div>
					</div>

				</c:if>
					
				</div>
			</div>

		</div>
	</div>


	<!-- start of the footer --
	<nav class="navbar navbar-default navbar-bottom">
		<div class="container">
			<a class="navbar-brand" href="#">@Copyright 2017</a>
		</div>
	</nav>
	<!-- end of the footer -->
	
	
	<script type="text/javascript">
	
		function addFriend(id){
			
			location.href="${pageContext.request.contextPath}/"+id+"/addFriend"; 
		}
	</script>
	

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Add Group</h4>
	      </div>
	      <div class="modal-body">
	        
	        		<form action="creategroup" method="post" model="baithak" enctype="multipart/form-data">
						  
						  <div class="form-group">
							    <label for="gName">Group Name:</label>
							    <input type="text" class="form-control" id="name" placeholder="Group Name" name="name" value ="">
							  </div>
							  <div class="form-group">
							    <label for="gDesc">Description</label>
							    <input type="text" class="form-control" id="discription" placeholder="Short Description for the group" name="discription" value ="">
							  </div>							  
							  
							  <div class="form-group">
							    <label for="gPhoto">Group Picture</label>
							    <input type="file"  accept="image/*" id="gPhoto" name="gPhoto" value ="">
							    <p class="help-block">
							    	<span style="color:red">* </span>
							    	Select Suitable Group Picture.
							    </p>
							    <p class="help-block text-right">
								  <span style="color:red">* </span>
								  You can add the members after creating the group.
							  </p>
							  </div>
								 
	      </div>
	      <div class="modal-footer">

		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Save changes</button>

	        </form>

	      </div>
	    </div>
	  </div>
	</div>

	
</body>
</html>

