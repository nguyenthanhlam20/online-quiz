<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Question List</title>

        <!-- DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">

        <!-- Custom CSS -->
        <style>
            /* Add padding to modal body */
            .modal-body {
                padding: 1.5rem;
            }

            /* Remove length change dropdown */
            .dataTables_length {
                display: none;
            }
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
                        <li>Question</li>
                    </ol>
                    <h2>Manage Question</h2>

                </div>
            </section><!-- End Breadcrumbs -->

            <section class="inner-page">
                <div class="container">
                    <h3 class="mb-4 text-center">Manage Questions of Test ${param.id} </h3>
                    <!-- Main Content -->
                    <div class="card p-3">

                        <!-- Button to trigger Add Question modal -->
                        <button type="button" class="btn btn-primary mb-3 w-25" data-bs-toggle="modal" data-bs-target="#addModal">
                            Add Question
                        </button>

                        <!-- Alert messages -->
                        <c:if test="${param.success ne null}">
                            <div class="alert alert-success" role="alert">
                                Success!
                            </div>
                        </c:if>
                        <c:if test="${param.fail ne null}">
                            <div class="alert alert-danger" role="alert">
                                Failed!
                            </div>
                        </c:if>

                        <div class="table-responsive">
                            <table id="questionTable" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Question</th>
                                        <th>Correct Answer</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="question" items="${questions}">
                                        <tr>
                                            <td>${question.question}</td>
                                            <td>${question.correctAnswer}</td>
                                            <td>
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                        data-bs-target="#editModal${question.id}">
                                                    Edit
                                                </button>
                                            </td>
                                        </tr>

                                        <!-- Modal for editing question -->
                                    <div class="modal fade" id="editModal${question.id}" tabindex="-1"
                                         aria-labelledby="editModalLabel${question.id}" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <!-- Added modal-lg class for large modal -->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editModalLabel${question.id}">Edit Question: ${question.question}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- Form fields for editing question -->
                                                    <form action="questions" method="post">
                                                        <input type="hidden" name="action" value="update">
                                                        <input type="hidden" name="id" value="${question.id}">
                                                        <div class="mb-3">
                                                            <!-- Added Bootstrap margin class -->
                                                            <label for="editQuestion${question.id}" class="form-label">Question:</label>
                                                            <input type="text" class="form-control" id="editQuestion${question.id}" name="question" value="${question.question}" required>
                                                        </div>
                                                        <input type="hidden" class="form-control" id="editTestId${question.id}" name="testId" value="${question.testId}">
                                                        <div class="mb-3">
                                                            <!-- Added Bootstrap margin class -->
                                                            <label for="editAnswer${question.id}" class="form-label">Answer:</label>
                                                            <input type="text" class="form-control" id="editAnswer${question.id}" name="answer" value="${question.answer}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <!-- Added Bootstrap margin class -->
                                                            <label for="editCorrectAnswer${question.id}" class="form-label">Correct Answer:</label>
                                                            <input type="text" class="form-control" id="editCorrectAnswer${question.id}" name="correctAnswer" value="${question.correctAnswer}" required>
                                                        </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Modal for adding question -->
                    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg"> <!-- Added modal-lg class for large modal -->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addModalLabel">Add Question</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Form fields for adding question -->
                                    <form action="questions" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <div class="mb-3"> <!-- Added Bootstrap margin class -->
                                            <label for="addQuestion" class="form-label">Question:</label>
                                            <input type="text" class="form-control" id="addQuestion" name="question" required>
                                        </div>
                                        <input type="hidden" class="form-control" name="testId" value="${param.id}" required>
                                        <div class="mb-3"> <!-- Added Bootstrap margin class -->
                                            <label for="addAnswer" class="form-label">Answer:</label>
                                            <input type="text" class="form-control" id="addAnswer" name="answer" required>
                                        </div>
                                        <div class="mb-3"> <!-- Added Bootstrap margin class -->
                                            <label for="addCorrectAnswer" class="form-label">Correct Answer:</label>
                                            <input type="text" class="form-control" id="addCorrectAnswer" name="correctAnswer" required>
                                        </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add Question</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main><!-- End #main -->


        <%@include file="footer.jsp" %>


        <!-- jQuery from CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- DataTables JS -->
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#questionTable').DataTable({
                    "lengthChange": false,
                    "pageLength": 5,
                    "searching": false,
                });
            });
        </script>

    </body>
</html>
