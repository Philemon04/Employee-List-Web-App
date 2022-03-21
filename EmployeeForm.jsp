<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee</title>
<link rel="stylesheet" href="add.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body class="text-center">

<div class="container">
	<main class="form-signin">
		<form action="update" method="post">
			<img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt=""
				width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">Update an Employee</h1>

			<input type="hidden" name="id" value="<c:out value='${employee.id}' />" />
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput"
					name="firstname" value="<c:out value='${employee.firstname}'/>">
				<label for="floatingInput">First Name</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" name="lastname"
					id="floatingInput" value="<c:out value='${employee.lastname}'/>">
				<label for="floatingInput">Last Name</label>
			</div>
			<div class="form-floating">
				<input type="email" class="form-control" name="email"
					id="floatingInput" value="<c:out value='${employee.email}'/>">
				<label for="floatingInput">Email</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" name="phonenumber"
					id="floatingInput" value="<c:out value='${employee.phonenumber}'/>">
				<label for="floatingInput">Phone Number</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" name="gender"
					id="floatingInput" value="<c:out value='${employee.gender}'/>">
				<label for="floatingInput">Gender</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" name="age"
					id="floatingInput" value="<c:out value='${employee.age}'/>">
				<label for="floatingInput">Age</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary" type="submit">Update
				Employee</button>
			<p class="mt-5 mb-3 text-muted">&copy;Employee Example</p>
		</form>
	</main>

</div>


</body>
</html>
