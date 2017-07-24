<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
<title>e-Baithak | Group</title>
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
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home"><img src="resources/img/logo.png" class="img-circle" height=35px></a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/logout"><h4>Logout</h4></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- end of the header -->

	<div class="container-fluid">
		<div class="row">
<!-- -------------------- left partion --------------------------------- -->			
			<div class="col-xs-4 col-sm-2 col-md-2">
				
			</div>
<!-- -------------------- left partion --------------------------------- -->
	
<!-- -------------------- middle partion --------------------------------- -->		
			<div class="col-xs-4 col-sm-8 col-md-8">
				<h3>middle</h3>
			</div>
<!-- -------------------- middle partion --------------------------------- -->
			
<!-- -------------------- right partion --------------------------------- -->
			<div class="col-xs-4 col-sm-2 col-md-2">	
				<h3>right</h3>
			</div>
<!-- -------------------- right partion --------------------------------- -->
			
		</div>
	</div>
</body>

</html>
