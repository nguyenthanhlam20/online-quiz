<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog</title>

    </head>
    <body>

        <!-- Navigation-->
        <%@include file="header.jsp" %>

        <main id="main">

            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs">
                <div class="container">

                    <ol>
                        <li><a href="home">Home</a></li>
                        <li>Ranking</li>
                    </ol>
                    <h2>Ranking</h2>

                </div>
            </section><!-- End Breadcrumbs -->

            <section class="inner-page">
                <div class="container">
                    <h3 class="mb-4 text-center">Top Users Ranking</h3>
                    <div class="row ">
                        <div class="col-sm-12 card mb-5 p-3">
                            <h4>Highest Average Score</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>User</th>
                                        <th>Average Score</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="userTest" items="${topScore}">
                                        <tr>
                                            <td>${userTest.id}</td>
                                            <td>${userTest.user.username}</td>
                                            <td>${userTest.score}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-sm-12 card p-3">
                            <h4>Highest Total Tests Taken</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>User</th>
                                        <th>Total Tests Taken</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="userTest" items="${topTaken}">
                                        <tr>
                                            <td>${userTest.id}</td>
                                            <td>${userTest.user.username}</td>
                                            <td>${userTest.score}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <!-- Main Content-->

        <%@include file="footer.jsp" %>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    </body>
</html>
