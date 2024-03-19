<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Test List</title>

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
                        <li>Test</li>
                    </ol>
                    <h2>Manage Test</h2>

                </div>
            </section><!-- End Breadcrumbs -->

            <section class="inner-page">
                <div class="container">
                    <!-- Main Content -->
                    <h3 class="mb-4 text-center">Manage Test</h3>
                    <div class="card p-3">

                        <!-- Button to trigger Add Test modal -->
                        <button type="button" class="btn btn-primary mb-3 w-25" data-bs-toggle="modal" data-bs-target="#addModal">
                            Add New Test
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
                            <table id="testTable" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="test" items="${tests}">
                                        <tr>
                                            <td>${test.title}</td>
                                            <td>${test.status}</td>
                                            <td>
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                        data-bs-target="#editModal${test.id}">
                                                    Edit
                                                </button>
                                                <a class="btn btn-secondary" href="questions?id=${test.id}">Questions</a>
                                            </td>
                                        </tr>

                                        <!-- Modal for editing test -->
                                    <div class="modal fade" id="editModal${test.id}" tabindex="-1"
                                         aria-labelledby="editModalLabel${test.id}" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <!-- Added modal-lg class for large modal -->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editModalLabel${test.id}">Edit Test: ${test.title}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- Form fields for editing test -->
                                                    <form action="tests" method="post">
                                                        <input type="hidden" name="action" value="update">
                                                        <input type="hidden" name="id" value="${test.id}">
                                                        <div class="mb-3">
                                                            <!-- Added Bootstrap margin class -->
                                                            <label for="editTitle${test.id}" class="form-label">Title:</label>
                                                            <input type="text" class="form-control" id="editTitle${test.id}" name="title" value="${test.title}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <!-- Added Bootstrap margin class -->
                                                            <label for="editStatus${test.id}" class="form-label">Status:</label>
                                                            <select class="form-select" id="editStatus${test.id}" name="status" required>
                                                                <option value="Active" ${test.status == 'Active' ? 'selected' : ''}>Active</option>
                                                                <option value="Inactive" ${test.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                                            </select>
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

                    <!-- Modal for adding test -->
                    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg"> <!-- Added modal-lg class for large modal -->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addModalLabel">Add Test</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Form fields for adding test -->
                                    <form action="tests" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <div class="mb-3"> <!-- Added Bootstrap margin class -->
                                            <label for="addTitle" class="form-label">Title:</label>
                                            <input type="text" class="form-control" id="addTitle" name="title" required>
                                        </div>
                                        <div class="mb-3"> <!-- Added Bootstrap margin class -->
                                            <label for="addStatus" class="form-label">Status:</label>
                                            <select class="form-select" id="addStatus" name="status" required>
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                            </select>
                                        </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add Test</button>
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
                $('#testTable').DataTable({
                    "lengthChange": false,
                    "pageLength": 5,
                    "searching": false,
                });
            });
        </script>

    </body>
</html>
