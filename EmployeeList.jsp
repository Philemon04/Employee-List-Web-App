<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
<link rel="stylesheet" href="index.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Company
			name</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<div class="navbar-nav">
			<div class="nav-item text-nowrap">
				<a class="nav-link px-3" href="#">Sign out</a>
			</div>
		</div>
	</header>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="home"></span> Dashboard
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span> Home
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="shopping-cart"></span> Products
						</a></li>
						<li class="nav-item active"><a class="nav-link active"
							aria-current="page" href="#"> <span data-feather="users"></span>
								Employee List
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="bar-chart-2"></span> Reports
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="layers"></span> Integrations
						</a></li>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<h2>Employee List</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>#</th>
								<th>FirstName</th>
								<th>LastName</th>
								<th>Email</th>
								<th>PhoneNumber</th>
								<th>Gender</th>
								<th>Age</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="employee" items="${listEmployee}">
								<tr>
									<td><c:out value="${employee.id }" /></td>
									<td><c:out value="${employee.firstname }" /></td>
									<td><c:out value="${employee.lastname }" /></td>
									<td><c:out value="${employee.email }" /></td>
									<td><c:out value="${employee.phonenumber }" /></td>
									<td><c:out value="${employee.gender }" /></td>
									<td><c:out value="${employee.age }" /></td>
									<td><a href="edit?id=<c:out value='${employee.id }'/>">
											update</a></td>
									<td><a href="delete?id=<c:out value='${employee.id }'/>">
											delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<a class="btn btn-primary me-md-2"
							href="<%=request.getContextPath()%>/new" type="button">Add</a>
					</div>
				</div>
			</main>
		</div>
	</div>


	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<script src="dashboard.js"></script>
</body>
</html>
