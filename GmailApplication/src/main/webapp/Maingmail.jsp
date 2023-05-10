<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Email Application</title>
  </head>
  <body>
  
  	<div class="container">
  
		  <!-- As a link -->
		<nav class="navbar bg-body-tertiary">
		  <div class="container-fluid">
		  	<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="48" height="48" viewBox="0 0 48 48">
			<path fill="#4caf50" d="M45,16.2l-5,2.75l-5,4.75L35,40h7c1.657,0,3-1.343,3-3V16.2z"></path><path fill="#1e88e5" d="M3,16.2l3.614,1.71L13,23.7V40H6c-1.657,0-3-1.343-3-3V16.2z"></path><polygon fill="#e53935" points="35,11.2 24,19.45 13,11.2 12,17 13,23.7 24,31.95 35,23.7 36,17"></polygon><path fill="#c62828" d="M3,12.298V16.2l10,7.5V11.2L9.876,8.859C9.132,8.301,8.228,8,7.298,8h0C4.924,8,3,9.924,3,12.298z"></path><path fill="#fbc02d" d="M45,12.298V16.2l-10,7.5V11.2l3.124-2.341C38.868,8.301,39.772,8,40.702,8h0 C43.076,8,45,9.924,45,12.298z"></path>
			</svg>
		    <h1 class="navbar-brand my-4"><Strong>Email Sending Application</Strong></h1>
		  </div>
		</nav>
		
		
	</div>
    <div class="container mt-5">
        
        <form action="Gmailservlet" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="recipient">From:</label>
            <input type="email" class="form-control" id="recipient" placeholder="Enter your email address" name="fromemail">
          </div>
          <div class="form-group">
            <label for="recipient">To:</label>
            <input type="email" class="form-control" id="recipient" placeholder="Enter recipient email address" name="toemail">
          </div>
          <div class="form-group">
            <label for="subject">Subject:</label>
            <input type="text" class="form-control" id="subject" placeholder="Enter email subject" name="subject">
          </div>
          <div class="form-group">
            <label for="message">Message:</label>
            <textarea class="form-control" id="message" rows="10" name="message" placeholder="Enter your message here"></textarea>
          </div>
          <div class="form-group">
            <input type="file" name="attachedfile" class="form-control my-2">
          </div>
          <button type="submit" class="btn btn-primary my-2">Send</button>
        </form>
      </div>
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
    <!-- Optional JavaScript; choose one of the two! -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script >
	var status = document.getElementById("status").value
	if(status=="sent"){
		swal({
            title: "Your Mail is Successfully sent",
            text: "success",
            icon: "success",
            button: "Done",
          });
	}
	if(status=="error"){
		swal({
            title: "Something eror",
            text: "Failed",
            icon: "error",
            button: "Done",
          });
	}
	
	
	</script>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>