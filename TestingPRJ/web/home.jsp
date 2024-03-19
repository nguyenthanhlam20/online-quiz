<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Quiz</title>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <main id="main">

            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs">
                <div class="container">

                    <ol>
                        <li><a href="home">Home</a></li>
                    </ol>
                    <h2>Welcome to online quiz</h2>

                </div>
            </section><!-- End Breadcrumbs -->

            <section class="inner-page">
                <div class="container">
                    <div class="row d-flex justify-content-center mt-4">
                        <!-- Post previews -->
                        <c:forEach var="post" items="${listPost}">
                            <div class="col-sm-12 col-md-6 col-xl-3">
                                <div class="card " style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">${post.title}</h5>
                                        <p class="card-text">Average score: ${post.avg}</p>
                                        <p class="card-text">Total taken times: ${post.total}</p>
                                        <div class="text-center">
                                            <a href="take-test?id=${post.id}" class="btn btn-primary w-100" >View</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!--<div class="d-flex justify-content-center my-4"><a class="btn btn-primary text-uppercase" href="home?count=${count + countStep}">More</a></div>-->
                </div>
            </section>

        </main><!-- End #main -->


        <!-- Page Header-->
        <!-- Main Content-->

        <%@include file="footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    </body>
</html>
