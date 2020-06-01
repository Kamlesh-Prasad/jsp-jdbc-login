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
    <link rel="stylesheet" href="css/fontawesoms.min.css">
    <style media="screen">
    body{background-image: url('./img/lightbg.jpg');}
    /* IDEA: login start */
    form button{
      background-color: #00bbcd!important;
      color: #fff!important;
      cursor: pointer;
      width: 100%;
      
      font-weight: bold!important;
    }
    form button:hover {
      transition: 2s;
      opacity: 1;
      background-color: #009a9c!important;
    }

    /* The Modal (background) */
    .modal {
      display: block; /* Hidden by default */
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgba(0, 87, 36, 0.44); /* Black w/ opacity */

    }
    /* Modal Content/Box */
    .modal-content {
      margin-left: 22%;
      margin-right: 22%;
      margin-top: 20%!important;
      width: 56%;
      border-radius: 10px!important;
    }
    .form-group label{font-weight: 500;font-size: 16px;letter-spacing: 0.8px;}
    .form-group input{font-weight: 500;font-size: 14px;font-weight: bold;letter-spacing: 0.8px;}
    /* Add Zoom Animation */
    .animate {
      -webkit-animation: animatezoom 0.6s;
      animation: animatezoom 0.6s
    }
.signup-model{
  margin-left: 18%;
  margin-right: 18%;
  margin-top: 5%!important;
  width: 64%;
}
    @-webkit-keyframes animatezoom {
      from {-webkit-transform: scale(0)}
      to {-webkit-transform: scale(1)}
    }

    @keyframes animatezoom {
      from {transform: scale(0)}
      to {transform: scale(1)}
    }

    /* Change styles for span and cancel button on extra small screens */

    @media screen and (max-width: 768px) {
      .modal-content{
        margin-left: 4%;
        margin-right: 4%;
        margin-top: 20%!important;
        width: 92%;
        height: 100%;

      }
    }

    /* IDEA: Login end */
    </style>
</head>

<body>
  <!--Login Modal -->
  <div class="modal">
    <div class="modal-dialog" role="document">
      <div class="modal-content animate">
        <div class="user-pic text-center pt-4">
          <img src="img/person-icon.png" alt="login" width="64px" height="64px">
        </div>
        <div class="modal-body">
          <form action="userlogin" method="post" ame="loginForm" id="login" novalidate>
            <fieldset class="form-group">
              <label for="InputEmail1">User Name</label>
              <input type="email" class="form-control" id="email" name="username" placeholder="Enter Email" required="true" />
            </fieldset>
            <fieldset class="form-group">
              <label for="InputPassword1">Password</label>
              <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required="true"/>
            </fieldset>
            <fieldset class="form-group">
              <input type="hidden" name="userlogin" value="UserRequest"/>
            </fieldset>
            <div class="text-center">
              <button type="submit" class="btn mb-2"><i class="fa fa-key" aria-hidden="true"> </i> Login</button>
              <button type="button" class="btn" data-toggle="modal" data-target="#signup"><i class="fa fa-key" aria-hidden="true"> </i><a href="register.jsp">Signup</a> </button>
            </div>
          </form>
        </div>
      </div><!-- IDEA: End model-content -->
    </div>
  </div>
  <!--End Login Modal -->
  
  
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
