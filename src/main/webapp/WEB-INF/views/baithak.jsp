<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
<title>e-Baithak | Group | ${baithak.name}</title>
<link href="resources/css/chat.css" type="text/css"
	rel="stylesheet" />
<link href="resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src ="resources/js/jquery.min.js"></script>
<script type="text/javascript" src ="resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src ="resources/js/bootstrap.min.js"></script>

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
					<li class="active"><a href="#">${baithak.name}<span class="sr-only">(current)</span></a></li>
					 
					 <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				          	Video Baithak <span class="caret"></span>
				          </a>
				          <ul class="dropdown-menu">
				            <li><a href="#">Select Members to add to Video Baithak</a></li>
				            <li role="separator" class="divider"></li>
				            
				            <li><a href="#">Me</a></li>
				            <li><a href="#">Member 1</a></li>
				            <li><a href="#">Member 2</a></li>
				            <li><a href="#">Member 3</a></li>
				            
				            <li role="separator" class="divider"></li>
				            <li><a href="#" class="btn btn-primary">+ Video Baithak</a></li>
				          </ul>
				    
				    </li>
					<li><a href="#">Leave Group</a></li>
					<li><a href="#" style="color:red">Delete Group</a></li>
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
			<div class="clearfix visible-xs-block"></div>

<!----------------------------------------- left partition of the webpage ------------------------------------------>
			<div class="col-xs-4 col-sm-2 col-md-2">
				<center>
					<img src="resources/baithakImg/${baithak.image}" alt="profile" class="thumbnail" width="150px" height ="150px">
					<h4>
						${baithak.name} 
						<br><br>
						 <small>${baithak.discription}</small>
					</h4>
					
				</center>
				<%-- <small> ${sessionScope.username}</small> --%>
						
					<!--  Includeing friends list and search friends -->
					<hr>
					<div class="col-md-12"id="" style="overflow-x:hidden; height:35px;"></div>
					<h4>Online members :</h4>
					<div class="col-md-12"id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">			
						<c:forEach var="result" items="${friendsList}">
							<h5>${result.username}</h5>
						</c:forEach>
						<hr>
							<h5>Online Member 1</h5>
							<h5>Online Member 2</h5>
							<h5>Online Member 3</h5>
							<h5>Online Member 4</h5>
							<h5>Online Member 5</h5>
						<hr>
					</div>
					<%--
	
					<h4>Add Members</h4>
					<form action="searchMyFriend" method="post" model="user">
							<div class="input-group">
								<input type="search" class="form-control" value="" name="username" placeholder="Friend Username/Name">
							</div>
						</form>
					<hr>
					
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
															<input type="submit" class="btn btn-primary" value="+ Add To Baithak">
														</th>
													</tr>
												</table>					
												</div>
												
											</form>
										</c:otherwise>
									</c:choose> 
							</c:forEach>
	 --%>
	
	<%--
					
					<h4>Search Results</h4>
						<div class="well" id="" style="overflow-y:hidden; overflow-x:hidden; height:190px;">
							
							<c:forEach var="result" items="${searchList}">
								<div class="alert alert-success" role="alert">			
									<c:choose>
										<c:when test="${myUsername == result.username}">
											<h4>${result.name} (${result.username})</h4>
										</c:when>
										<c:otherwise>
										<form action="addMember" method="POST">
											<input type="hidden" name="friendId" value="${result.id}">
											<input type="hidden" name="groupId" value="${baithak.id}">
											<h4>${result.name} (${result.username})<input type="submit" class="btn btn-primary pull-right" value="+ Add Member"></h4>
										</form>
											 <input type="button" class="btn btn-success pull-right" style="margin-right:20px;" value="Send Request" onClick="addFriend(${result.id})">
										</c:otherwise>
									</c:choose> 
								</div>
							</c:forEach>	
						</div>
--%>
			</div>
<!----------------------------------------- left partition of the webpage ------------------------------------------>


<!------------------------------------------- middle partition of the webpage -------------------------------------->
			<div class="col-xs-4 col-sm-8 col-md-8 container-fluid">
				<div class="col-lg-12">
					
					<!--  Includeing Search result for Adding Friends -->
					<%-- <h4>Search Results</h4>
						<div class="well" id="" style="overflow-y:scroll; overflow-x:hidden; height:105px;">
							
							<c:forEach var="result" items="${searchList}">
								<div class="alert alert-success" role="alert">			
									<c:choose>
										<c:when test="${myUsername == result.username}">
											<h4>${result.name} (${result.username})</h4>
										</c:when>
										<c:otherwise>
										<form action="addFriend" method="POST">
											<input type="hidden" name="friendId" value="${result.id}">
											<h4>${result.name} (${result.username})<input type="submit" class="btn btn-primary pull-right" value="+ Add Friend"></h4>
										</form>
											<input type="button" class="btn btn-success pull-right" style="margin-right:20px;" value="Send Request" onClick="addFriend(${result.id})">
										</c:otherwise>
									</c:choose> 
								</div>
							</c:forEach>	
						</div>
 --%>					
					<!-- <hr> -->

					<!--  Includeing friend request -->
					<%-- <%@include file="friendRequest.jsp" %> --%>
							<!-- <h4>khec-computer-virus</h4> -->
					<div class="well" id="" style="overflow-y:scroll; overflow-x:hidden; height:auto;">
						<div class="col-md-8" style="height:400px;">
							<div class="row">
							</div>
						</div>
					</div>
					<div class="well" id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">
						<div class="col-md-12" style="height:45px;">
							<div class="row">
								<form action="" method="post">
						<div class="input-group">
							<input type="text" class="form-control input-lg" name="message"
								placeholder="Enter Message .....">
								<!-- <textarea class="form-control" rows="2"></textarea> -->
							<span class="input-group-btn"> <input
								class="btn btn-success btn-lg" type="submit" value="Send">
						</div>
					</form>
		
							</div>
						</div>
					</div>			
				</div>				
			</div>
<!----------------------------------------- middle partition of the webpage --------------------------------------->


<!----------------------------------------- right partition of the webpage ------------------------------------------>
			<div class="col-xs-4 col-sm-2 col-md-2">
			
			
					<a href="" class="btn btn-primary" data-toggle="modal" data-target="#myModal"
							data-toggle="tooltip" data-placement="right" title="Add members to ${baithak.name} ">
						+ Add Members
					</a>
					
						
				<div id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">
					<h4>Group Member :</h4>
					<div class="col-md-12"id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">			
						<c:forEach var="result" items="${friendsList}">
							<h5>${result.username}</h5>
						</c:forEach>
						<hr>
							<h5>Member 1</h5>
							<h5>Member 2</h5>
							<h5>Member 3</h5>
							<h5>Member 4</h5>
							<h5>Member 5</h5>
						<hr>
					</div>
				<!-- 
					<div class="col-md-12"id="" style="overflow-x:hidden; height:35px;"></div>
					<h4>Online :</h4>
					<div class="col-md-12"id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">			
						<c:forEach var="result" items="${friendsList}">
							<h5>${result.username}</h5>
						</c:forEach>
						<hr>
							<h5>Online Member 1</h5>
							<h5>Online Member 2</h5>
							<h5>Online Member 3</h5>
							<h5>Online Member 4</h5>
							<h5>Online Member 5</h5>
						<hr>
					</div>
				 -->
				 
				</div>
			</div>
<!----------------------------------------- right partition of the webpage ------------------------------------------>
		</div>
	</div>


<!-------------------------------------------------- start of the footer ------------------------------------------->
	<!-- 
	<nav class="navbar navbar-default navbar-bottom">
		<div class="container">
			<a class="navbar-brand" href="#">@Copyright 2017</a>
		</div>
	</nav>
	 -->
<!-------------------------------------------------- end of the footer --------------------------------------------->
	
	
	<script type="text/javascript">
		function addFriend(id){
			location.href="${pageContext.request.contextPath}/"+id+"/addFriend"; 
		}
	</script>
	

<!--------------------------------------------------- Modal -------------------------------------------------------->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Add Members to <b>${baithak.name}</b></h4>
	      </div>
	      <div class="modal-body">
	        						
	        		<form action="addMembers" method="post" model="group">
						<input type="hidden" name="groupId" value=${baithak.id}>
						<input type="hidden" name="created_by" value=${baithak.created_by}>				  											
						
						<c:forEach var="fresult" items="${friendsList}">	
							
							<div class="form-group col-md-6">
							    <input type="hidden" name="userId" value=${fresult.id}>	
								&nbsp;&nbsp;&nbsp;&nbsp;<img src = "resources/userImg/${fresult.photo}" width="40px" height = "40px"> ${fresult.name} (${fresult.username})
							</div>
							 
						</c:forEach>
		</div>
	    <div class="modal-footer">

				        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				        <button type="submit" class="btn btn-primary">+ Confirm</button>
		
			        </form>

	      </div>
	    </div>
	  </div>
	</div>
<!-- ----------------------------------------------- model ------------------------------------------------------ -->
	
</body>
</html>

