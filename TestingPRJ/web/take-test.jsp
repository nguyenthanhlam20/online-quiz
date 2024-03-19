<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Take Test</title>

        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <style>
            /* Add your custom styles here */
        </style>
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
                        <li>Take Test</li>
                    </ol>
                    <h2>Do your best</h2>

                </div>
            </section><!-- End Breadcrumbs -->

            <section class="inner-page">
                <div class="container">
                    <c:if test="${param.success ne null}">
                        <div class="alert alert-success" role="alert">
                            Take test success!
                            Your score: ${param.score}
                        </div>
                    </c:if>
                    <c:if test="${param.fail ne null}">
                        <div class="alert alert-danger" role="alert">
                            Take test failed!
                        </div>
                    </c:if>

                    <!-- Display Test Information -->
                    <div class="mb-4 text-center">
                        <h3 class="fw-bold">${test.title}</h3>
                        <span class="fs-italic"><strong>Description:</strong> English testing</span>
                        <p><strong>Duration:</strong> 30 minutes</p>
                    </div>

                    <!-- Display Questions -->
                    <form action="take-test" method="post">
                        <input type="hidden" name="testId" value="${test.id}">
                        <div class="card">
                            <div class="card-header">
                                <h4>Questions</h4>
                            </div>
                            <div class="card-body">
                                <c:forEach var="question" items="${questions}">
                                    <div class="form-group">
                                        <label>${question.question}</label><br>
                                        <c:forEach var="answer" items="${fn:split(question.answer, ',')}">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="answers[${question.id}]" value="${answer}">
                                                <label class="form-check-label">${answer}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary mt-3">Submit Test</button>
                    </form>
                </div>
            </section>

        </main><!-- End #main -->


        <%@include file="footer.jsp" %>


        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
