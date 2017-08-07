<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!-- refresh the page after 3 seconds. -->
<%-- response.setIntHeader("Refresh", 3); --%>

<html>
<head>
<title>e-Baithak | ${baithak.name}</title>
<link href="resources/css/chat.css" type="text/css"
	rel="stylesheet" />
<link href="resources/css/bootstrap.min.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src ="resources/js/jquery.min.js"></script>
<script type="text/javascript" src ="resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src ="resources/js/bootstrap.min.js"></script>

<!-- Scroll to the last chat 
<script type="text/javascript">

	$(document).ready(function(){
		$('#chat').scrollTop($('#chat')[0].scrollHeight);
	}); 
	
</script>
-->

<!--  send message using ajax on click-->
<script type="text/javascript">

	$(document).ready(function(){
		 $('#send_chat').click(function(){
			 
			var msg = $('#chat_data').val();
			baithakId = ${baithak.id}
			myId = ${myId}
			
			$.ajax({
			    type: "GET",
		        url: "setMessages",
		        data: {
		        	"message" : msg,
		        	"bId" : baithakId,
		        	"uId" : myId,
		        	},
		        contentType: "application/json",
		        
		        success: function (data) {
		            console.log("Message = "+msg+" \nFrom userId = "+myId+" \nTo groupId = "+baithakId);
		            
		            document.getElementById('chat_data').value = "";
		            $("#chat_data").focus();
		        },
		        
		        error: function (data) {
		        	$("#chat_data").focus();
		            console.log("message sending error")
		        },
			});
		});
	});

</script>

<!-- get all messages using ajax -->
<script type ="text/javascript">

$(document).ready(function(){
	baithakId = ${baithak.id}
	myId = ${myId}
	
	var interval = 1500;  // 1000 = 1 second, 3000 = 3 seconds
	function doAjax() {
	
	$.ajax({
        type: "GET",
        url: "getMessages",
        data: {
        	"bId" : baithakId
        	},
        //data:"",
        contentType: "application/json",
        
        success: function (data) {
            //alert(data + " success");
            $.each(data, function(index, msg) {
            	
                //console.log(msg); //to print the json data
                
                content = "<strong>"+msg.senderId+" : </strong>"+msg.message+"";
                
                if (msg.senderId == myId ){
                	div = "<div class='col-md-8'><div class='alert alert-success' role='alert'>"+content+"</div></div>";
                	//div = "<p style='color:red'>"+ msg.message+" "+msg.senderId+"</p>";
                	$('#Msg').append(div);
                }
                else{
                	div = "<div class='col-md-8 col-md-offset-4'><div class='alert alert-info' role='alert'>"+content+"</div></div>";
                	$('#Msg').append(div);
                }
                
                //$('#response1').html(msg.senderId);
            });
        },
        error: function (data) {
            alert(data + " error");
        },
        complete: function (data) {
            // Schedule the next
            //$( "#Msg" ).remove();
            //setTimeout(doAjax, interval);
    	}
    });
	}
	setTimeout(doAjax, interval);
	
});

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
				    <li><a href="videochat">Video Chat</a></li>
					<li><a href="#">Leave Group</a></li>
					<c:if test="${myId == baithak.created_by}">
						<li><a href="#" style="color:red">Delete Group</a></li>
					</c:if>
				
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
					<p style="color:BLUE; font-size:18px;"><Strong>Active Members :</Strong><p>
					<div class="col-md-12"id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">			
						<c:forEach var="result" items="${activeMemberList}">
								<table>
									<tr>
										<th rowspan="3">
											<img src = "resources/userImg/${result.photo}" class="img-circle" width="40px" height = "40px">
										</th>
										<td style="color:GREEN">&nbsp;&nbsp;${result.username}</td>
										<td>&nbsp;
											<img src = "resources/img/active.png" class="img-circle" width="10px" height="10px">
										</td>
									</tr>
								</table>
						</c:forEach>
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

<div id ="test"></div>
<!------------------------------------------- middle partition of the webpage -------------------------------------->
			<div class="col-xs-4 col-sm-8 col-md-8 container-fluid">
				<div class="col-lg-12">
					
					<%--  
					<jsp:include page="textbaithak.jsp" />
					 --%>
					
					<iframe src="chatframe?bId=${baithak.id}" width="100%" height="72%">
					
					</iframe>
					
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
					
					<div class="well" id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">
						<div class="col-md-12" style="height:45px;">
							<div class="row">
							<!-- 
								<form action="textbaithak" method="post" model="message">
							 -->
									 <div class="input-group">
										<input type="hidden" name="groupId" value="${baithak.id}">
										<input type="text" class="form-control input-lg" name="message"
											id="chat_data" placeholder="Enter Message ....." autofocus>
										
										<!-- <textarea class="form-control" rows="2"></textarea> -->
										<span class="input-group-btn"> 
											<input id="send_chat" class="btn btn-success btn-lg" type="button" value="Send">
										</span>
									</div>
							<!-- 
								</form>
							 -->
							</div>
						</div>
					</div>			
				</div>				
			</div>
<!----------------------------------------- middle partition of the webpage --------------------------------------->


<!----------------------------------------- right partition of the webpage ------------------------------------------>
			<div class="col-xs-4 col-sm-2 col-md-2">
			
			<c:if test="${myId == baithak.created_by}">
				<hr>
					<a href="" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"
							data-toggle="tooltip" data-placement="right" title="Add members to ${baithak.name} ">
						+ Add Members
					</a>
			</c:if>
			
					
				<hr>	
				<div id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">
					<p style="color:BLUE; font-size:18px;"><Strong>Group Members :</Strong><p>
					<div class="col-md-12"id="" style="overflow-y:hidden; overflow-x:hidden; height:auto;">			
						<c:forEach var="result" items="${memberList}">
								<table>
									<tr>
										<th rowspan="3">
											<img src = "resources/userImg/${result.photo}" class="img-rounded" width="35px" height = "35px">
										</th>
										<td>&nbsp;&nbsp;${result.username}</td>
									</tr>
								</table>
						</c:forEach>
						<!-- <hr>
							<h5>Member 1</h5>
							<h5>Member 2</h5>
							<h5>Member 3</h5>
							<h5>Member 4</h5>
							<h5>Member 5</h5>
						<hr> -->
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

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Add Members to <b>${baithak.name}</b></h4>
	      </div>
	      <div class="modal-body"></div>
	    	<div class="modal-footer">
				<form action="addMembers" method="post" model="group">
						<input type="hidden" name="groupId" value=${baithak.id}>
						<input type="hidden" name="created_by" value=${baithak.created_by}>				  											
						<c:forEach var="fresult" items="${friendsList}">	
							<div class="form-group col-md-6">
								<table>
									<tr>
										<th rowspan="3">
											<img src = "resources/userImg/${fresult.photo}" class="img-rounded" width="80px" height = "80px">
										</th>
										<th>&nbsp;&nbsp;&nbsp;&nbsp;${fresult.name}</th>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;${fresult.username}</td>
									</tr>
									<tr>
										<th>&nbsp;&nbsp;
											<button type="submit" class="btn btn-primary" name="userId" value="${fresult.id}">+ Add</button>
										</th>
									</tr>
								</table>
							</div>		 
						</c:forEach>
					</form>
	      </div>
	    </div>
	  </div>
	</div>

<!-- ----------------------------------------------- model ------------------------------------------------------ -->
	
</body>
</html>

