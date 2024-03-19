
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Change Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- Page Header-->
        <main id="main">

            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs">
                <div class="container">

                    <ol>
                        <li><a href="home">Home</a></li>
                        <li>Change Password</li>
                    </ol>
                    <h2>Enter your new password</h2>

                </div>
            </section><!-- End Breadcrumbs -->

            <section class="inner-page">
                <div class="container">
                    <h2 class="card-title text-center mb-4">Change Password</h2>
                    <div class="card">
                        <div class="card-body">

                            <%-- Display error message if exists --%>
                            <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= request.getAttribute("error") %>
                            </div>
                            <% } %>

                            <%-- Display success message if exists --%>
                            <% if (request.getAttribute("message") != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= request.getAttribute("message") %>
                            </div>
                            <% } %>

                            <form action="change-password" method="post">
                                <div class="form-group">
                                    <input type="hidden" class="form-control" id="username" name="username" value="${sessionScope.user.username}">
                                </div>
                                <div class="form-group">
                                    <label for="currentPassword">Current Password</label>
                                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" placeholder="Enter current password">
                                </div>
                                <div class="form-group">
                                    <label for="newPassword">New Password</label>
                                    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password">
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword">Confirm New Password</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Retype new password">
                                </div>
                                <button type="submit" class="btn btn-primary">Change Password</button>
                            </form>
                        </div>
                    </div>
                </div>
            </section>

        </main><!-- End #main -->


        <%@include file="footer.jsp" %>
        <!-- Bootstrap JS (Optional) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
