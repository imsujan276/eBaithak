<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<c:choose>
	<c:when test="fList == 0">
	
	</c:when>
	<c:otherwise>
		 
		     <h4>Friend Requests</h4>
						<div class="well" id="" style="overflow-y:scroll; overflow-x:hidden; height:140px;">
		
							<div class="alert alert-success" role="alert">
								
									Name ( Username )
									<a href="" class="btn btn-danger pull-right"  style="margin-right:20px;">Reject</a>
									<a href="" class="btn btn-success pull-right" style="margin-right:20px;">Accept Request</a>
							</div>

						</div>
					
					<hr>
					
	</c:otherwise>
</c:choose> 


