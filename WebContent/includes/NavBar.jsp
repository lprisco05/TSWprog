<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link rel = "stylesheet" href = "NavBarStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



<nav class="navbar navbar-expand-lg navbar-light bg-light" id = "box">

	<div class="container">
		<a class="navbar-brand" href="index.jsp">Arduino Buy</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart
						<span class="badge badge-danger px-1">${ cart_list.size() }</span>
				</a></li>


				<%
				if (auth != null) { //ignoriamo questo errore
				%>
				<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="user.jsp">Profilo</a>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a>
					<%
					} else {
					%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>

				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>