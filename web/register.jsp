<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Form</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
    <h1>Registration Form</h1>
    <form action="<%=request.getContextPath()%>/insert" method="post">
        <div class="form-group">
            <label for="firstname">First name:</label> <input type="text"
                                                     class="form-control" id="firstname" placeholder="First name"
                                                     name="firstname" required>
        </div>
        <div class="form-group">
            <label for="lastname">Last Name:</label> <input type="lastname"
                                                           class="form-control" id="lastname" placeholder="Last name"
                                                           name="lastname" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label> <input type="email"
                                                     class="form-control" id="email" placeholder="Email"
                                                     name="email" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label> <input type="password"
                                                           class="form-control" id="password" placeholder="Password"
                                                           name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
</body>
</html>