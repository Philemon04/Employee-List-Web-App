<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
<link rel="stylesheet" href="add.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body class="text-center">

	<main class="form-signin">
		<form action="insert" method="post">
			<img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt=""
				width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">Add an Employee</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					name="firstname" required="required"> <label
					for="floatingInput">First Name</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					name="lastname" required="required"> <label
					for="floatingInput">Last Name</label>
			</div>
			<div class="form-floating">
				<input type="email" class="form-control" id="floatingInput"
					name="email" required="required"> <label
					for="floatingInput">Email</label>
			</div>
			<div class="form-floating">
				<input type="tel" class="form-control" id="floatingInput"
					name="phonenumber" required="required"> <label
					for="floatingInput">Phone Number</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					name="gender" required="required"> <label
					for="floatingInput">Gender</label>
			</div>
			<div class="form-floating">
				<input type="number" class="form-control" id="floatingInput"
					name="age" required="required"> <label for="floatingInput">Age</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary" type="submit">Add
				Employee</button>
			<p class="mt-5 mb-3 text-muted">&copy;Employee Example</p>
		</form>
	</main>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
