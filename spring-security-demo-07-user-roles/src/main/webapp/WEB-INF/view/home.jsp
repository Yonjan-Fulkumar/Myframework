<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>luv2code Company Home Page</title>
</head>
<body>

	<h2>luv2code company home page</h2>
	<hr>
		<p>
		welcome to the luv2code company home page!
		</p>
		
		<hr>
		
		<!-- display user name and role -->
		
		<p>
			User: <security:authentication property="principal.username" />
			<br><br>
			Role(s): <security:authentication property="principal.authorities" />

		</p>

		
		<security:authorize access="hasRole('MANAGER')">
		
			<!-- add a link to point to / leader... this is for the managers -->
				
			<p>
				<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
				(Only for Manager peeps)
		
			</p>
		
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
		
			<!-- add a link to point to systems.. this is for the admin -->
			
			<p>
			
				<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admin peers)
			</p>
		
		</security:authorize>

		<!-- add a logout button -->
		<form:form action="${pageContext.request.contextPath}/logout" 
					method="POST">
					
		<input type="submit" value="Logout" />
		</form:form>

</body>
</html>