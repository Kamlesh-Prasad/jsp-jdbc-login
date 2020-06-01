<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login User</title>
   <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">    
	<!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Bootstrap fontawesome css -->
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/fontawesoms.min.css">
    <style media="screen">
    body{background-image: url('./img/lightbg.jpg');}
    .card{border-radius:20px;}
 .divider-text {
    position: relative;
    text-align: center;
    margin-top: 12px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}
.card{margin:0 35%;}
    </style>
</head>

<body>
  <div class="container mt-4 pt-4">
<div class="card mt-2 pt-4 bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	
	<form action="checkRegister" method="post" ame="registerForm" id="register" novalidate>
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input type="text" class="form-control" id="name" name="name" placeholder="Full name" required="true" />
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
         <input type="email" class="form-control" id="email" name="email" placeholder="Email address" required="true" />
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
		<select class="custom-select" style="max-width: 70px;">
		    <option selected="">+91</option>
		    <option value="1">+001</option>
		    <option value="2">+198</option>
		    <option value="3">+701</option>
		</select>
    	<input type="number" class="form-control number" id="mobile" name="mobile" placeholder="Phone number" required="true" />
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
		</div>
		 <input type="text" class="form-control" id="username" name="username" placeholder="Username" required="true" />
	</div> <!-- form-group end.// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input type="password" class="form-control" name="password" placeholder="Password" >
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input type="password" class="form-control" name="password" placeholder="Confirm password" >
    </div> <!-- form-group// -->                                      
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">Have an account? <a href="/Login-Application1">Log In</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->

  
  
 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

 <script>
    //Implement Tooltip
    $(document).ready(function(){
      $('[data-toggle="tooltip"]').tooltip();
    });

    //Login Validation Script
    $(document).ready( function(){
      //simple validation at client's end
      $( "#login" ).submit(function( event ){ //on form submit
          var proceed = true;
          //loop through each field and we simply change border color to red for invalid fields
            $("#login input[required=true], #login textarea[required=true]").each(function(){
            $(this).css('border-color','');
            if(!$.trim($(this).val())){ //if this field is empty
              $(this).css('border-color','red'); //change border color to red
               proceed = false; //set do not proceed flag
            }
            //check invalid email
            var email_reg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if($(this).attr("type")=="email" && !email_reg.test($.trim($(this).val()))){
              $(this).css('border-color','red'); //change border color to red
              proceed = false; //set do not proceed flag
            }
            });

        if(proceed){ //if form is valid submit form
          return true;
        }
        event.preventDefault();
      });

       //reset previously set border colors and hide all message on .keyup()
      $("#login input[required=true], #login textarea[required=true]").keyup(function() {
        $(this).css('border-color','');
        $("#result").slideUp();
      });
    });
    //Login Validation Script End
    //Signup Validation Script start
    $(document).ready( function(){
      //simple validation at client's end
    	$( "#register" ).submit(function( event ){ //on form submit
    	    var proceed = true;
    	    //loop through each field and we simply change border color to red for invalid fields
            $("#register input[required=true], #register textarea[required=true]").each(function(){
    				$(this).css('border-color','');
    				if(!$.trim($(this).val())){ //if this field is empty
    					$(this).css('border-color','red'); //change border color to red
    				   proceed = false; //set do not proceed flag
    				}
    				//check invalid name
    				var name_reg = /^[a-zA-Z\s]+$/;
    				if($(this).attr("type")=="text" && !name_reg.test($.trim($(this).val()))){
    					$(this).css('border-color','red'); //change border color to red
    					proceed = false; //set do not proceed flag
    				}

            //check invalid email
    				var email_reg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    				if($(this).attr("type")=="email" && !email_reg.test($.trim($(this).val()))){
    					$(this).css('border-color','red'); //change border color to red
    					proceed = false; //set do not proceed flag
    				}

            //check invalid number
    				var mobile_reg = /^[1-9]\d{9}$/;
    				if($(this).attr("type")=="number" && !mobile_reg.test($.trim($(this).val()))){
    					$(this).css('border-color','red'); //change border color to red
    					proceed = false; //set do not proceed flag
    				}

            /*
            //check invalid username
            var username_reg = /^[1-9]\d{9}$/;//pandding code
            if($(this).attr("type")=="text" && !username_reg.test($.trim($(this).val()))){
              $(this).css('border-color','red'); //change border color to red
              proceed = false; //set do not proceed flag
            }

            //check invalid password
            var password_reg = /^[1-9]+^[a-zA-Z\s]+$/;//pandding code
            if($(this).attr("type")=="text" && !username_reg.test($.trim($(this).val()))){
              $(this).css('border-color','red'); //change border color to red
              proceed = false; //set do not proceed flag
            }
            */

            });

    		if(proceed){ //if form is valid submit form
    			return true;
    		}
    		event.preventDefault();
    	});

    	 //reset previously set border colors and hide all message on .keyup()
    	$("#register input[required=true], #register textarea[required=true]").keyup(function() {
    		$(this).css('border-color','');
    		$("#result").slideUp();
    	});
    });
    //Signup Validation Script End

    </script>
</body>

</html>
