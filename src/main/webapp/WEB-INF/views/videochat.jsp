<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Video Chat</title>
</head>
<body>

	<div id="container" class="jumbotron">
	</div>
	<div>
		Conversation id:<input id="convId" type="text"/>
		<button onclick="createConversation()">Create</button>
		<button onclick="createBroadcastConversation()">Create broadcast</button>
		<button onclick="joinConversation()">Join</button>
		<button onclick="leaveConversation()">Leave</button>
	</div>
	<div>
		<ul id="log">
	
		</ul>
	</div>
	<div>
		<video id="template" width="320" height="240" autoplay controls></video>
	</div>
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="resources/js/nextRTC.js"></script>
	<script src="resources/js/jquery-2.1.3.min.js"></script>
	
	<script type="text/javascript">	
			var createConversation = function(){
				var convId = $('#convId').val();
				console.log(convId);
				nextRTC.create(convId);
			};
			var createBroadcastConversation = function(){
				var convId = $('#convId').val();
				nextRTC.create(convId, {type : 'BROADCAST'});
			};
			var joinConversation = function(){
				var convId = $('#convId').val();
				nextRTC.join(convId);
			};
			var leaveConversation = function(){
				$('#container').empty();
				nextRTC.leave();
			};
			

			var nextRTC = new NextRTC({
				// required
				wsURL : 'ws://localhost:8080/eBaithak/signaling',
			        // required
				mediaConfig : {
					video : true,
			                sdpConstraints : {
						'mandatory' : {
							'OfferToReceiveVideo' : true
						}
					},
				},
				// optional in local network
				peerConfig : {
					'iceServers' : [
						{ url : "stun:stun.l.google.com:19302" } 
					]
				}
			});
		
			nextRTC.on('created', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				$('#log').append('<li>Room with id ' + event.content + ' has been created, share it with your friend to start videochat</li>');
			});
			nextRTC.on('joined', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				$('#log').append('<li>You have been joined to conversation ' + event.content + '</li>');
			});
			nextRTC.on('newJoined', function(nextRTC, event) {
				console.log(JSON.stringify(event));
				$('#log').append('<li>Member with id ' + event.from + ' has joined conversation</li>');
			});
			nextRTC.on('localStream', function(member, stream) {
				var dest = $("#template").clone().prop({ id: 'local'});
				$("#container").append(dest);
				dest[0].srcObject = stream.stream;
				dest[0].muted = true;
			});
			nextRTC.on('remoteStream', function(member, stream) {
				var dest = $("#template").clone().prop({ id: stream.member});
				$("#container").append(dest);
				dest[0].srcObject = stream.stream;
			});
			nextRTC.on('left', function(nextRTC, event) {
				nextRTC.release(event.from);
				console.log(JSON.stringify(event));
				$('#' + event.from).remove();
				$('#log').append('<li>' + event.from + " left!</li>");
			});
			nextRTC.on('error', function(nextRTC, event) {
	            console.log(JSON.stringify(event));
	            $('#log').append('<li>Something goes wrong! '+ event.content +'</li>')
	        });
			
		</script>
</body>
</html>