<!DOCTYPE html>
<html>
<head>
    <title></title>
	<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1" />	
	<meta name="description" content="" />
	<meta name="keywords" content="" />

	<link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/stylesheet.css" type="text/css"/>
	<link rel="stylesheet" href="assets/css/flick/jquery-ui-1.8.16.custom.css" type="text/css"/>

	<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$(".notifyme").click(function(e){
				
				var id = $(this).data('item');
				var name = $('#name');
				var email = $('#email');

				$("#dialog").dialog({
					width:500,
					modal:true,
					position: 'center',
					resizable: false,
					buttons: {
						Submit : function(){
							
							// if the data is valid add our notification to the db
							if( validate(name,email) ){

								// ajax post
								$.ajax({
									url: 'NotifyMe.cfc?method=addNotification',
									data: {
										id: id,
										name: name.val(),
										email: email.val()	
									},
									type: 'post',
									dataType: 'json',
									success: function(){
										// hide the form + buttons and show the success message
										$('#dialog').dialog('option','buttons','');
										$('#frmNotifyMe').slideToggle();
										$('.success').slideToggle();
									},
									error: function(xhr, textStatus, errorThrown){
									
									}
								});
																
							} else {
								$('.required').html('Please enter your full name and a valid email address.');
							}

						},
						Cancel: function() {
							$( this ).dialog( "close" );
						}
					},
					close : function(event,ui){
						$('#name').val('');
						$('#email').val('');
						$('.required').html('All Fields Required');
					}
				});

			});
					
		});
		
		// validate user input
		function validate(name,email) {
			if( name.val().length > 0 && isValidEmail(email.val()) ){
				return true;
			}
			return false;
		}	

		// validates email address
		function isValidEmail(str){
   			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
   			return emailPattern.test(str);  			
		}
	</script>
</head>
<body>

	<div class="container">

		<div class="content">
			<div class="page-header">
				<h1>Shopping Cart <small>Flex Book Store</small></h1>
			</div>

			<ul class="breadcrumb">
				<li><a href="#">Home</a> <span class="divider">/</span></li>
				<li><a href="#">Products</a> <span class="divider">/</span></li>
				<li><a href="#">Books</a> <span class="divider">/</span></li>
				<li class="active">Flex</li>
			</ul>		

			<div class="row">
				<div class="span10">			
					<h2>Flex Books</h2>

					<div class="product">
						<img src="assets/images/android_w_flex.jpg" width="100">
						<div class="details">
							<h2>Android Applications with Flex 4.5</h2>
							List Price: $24.99<br/>
							<span class="sale">Price: $21.36</span><br/>
							You Save: $3.63 (15%)<br/>
							In Stock: Yes<br/>
							<div class="buttons">
								<button class="btn primary">Add To Cart</button>
							</div>
						</div>
					</div>

					<div class="product">
						<img src="assets/images/flex4cookbook.jpg" width="100">
						<div class="details">
							<h2>Flex 4 Cookbook</h2>
							List Price: $49.99<br/>
							<span class="sale">Price: $31.46</span><br/>
							You Save: $18.50 (37%)<br/>
							In Stock: No<br/>
							<div class="buttons">
								<button class="btn primary">Add To Cart</button>
								<button class="btn danger notifyme" data-item="1234">In Stock Notifications</button>
							</div>
						</div>
					</div>					

					<div class="product last">
						<img src="assets/images/tfts.jpg" width="100">
						<div class="details">
							<h2>Adobe Flex 4: Training from the Source</h2>
							List Price: $49.99<br/>
							<span class="sale">Price: $31.49</span><br/>
							You Save: $18.50 (37%)<br/>
							In Stock: Yes<br/>
							<div class="buttons">
								<button class="btn primary">Add To Cart</button>
							</div>
						</div>
					</div>

				</div>
				<div class="span4">
					<h3>Categories</h3>
					<ul class="categories">
						<li><a href="#">ColdFusion</a></li>
						<li><a href="#">Java</a></li>
						<li><a href="#">PHP</a></li>
						<li><a href="#" class="active">Flex</a></li>
						<li><a href="#">Groovy</a></li>
						<li><a href="#">Rails</a></li>
						<li><a href="#">Python</a></li>
						<li><a href="#">JavaScript</a></li>
						<li><a href="#">CSS</a></li>
						<li><a href="#">jQuery</a></li>
						<li><a href="#">Git</a></li>
						<li><a href="#">ActionScript</a></li>
						<li><a href="#">.NET</a></li>
						<li><a href="#">Tomcat</a></li>
						<li><a href="#">Hibernate</a></li>																		
					</ul>
				</div>
			</div>
		</div>

		<footer>
			<p>This is a sample application showing off Bootstrap/jQuery/jQuery-ui and was created by Dan Vega</p>
		</footer>

	</div>

	<!--- in stock notifications dialog --->
	<div id="dialog" title="In Stock Notifications" style="display:none;">

		<div class="alert-message success" style="display:none;margin:20px;">
        	<p><strong>Thank You!</strong> We will notify you when this product becomes available.</p>
      	</div>

		<form id="frmNotifyMe">
			<p>If you would like to be notified when this product is in stock please enter your information below. We will only use this info to contact your regarding the availability of this product.</p>

			<p class="required">All Fields Required</p>
			<div class="clearfix">
				<label for="xlInput">Full Name</label>
				<div class="input">
					<input class="xlarge" id="name" name="name" size="30" type="text">
				</div>
			</div>
			<div class="clearfix">
				<label for="xlInput">Email Address</label>
				<div class="input">
					<input class="xlarge" id="email" name="email" size="30" type="text">
				</div>
			</div>
		</form>
		
	</div>


</body>
</html>