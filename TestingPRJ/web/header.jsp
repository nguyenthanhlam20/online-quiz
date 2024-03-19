<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
      type="text/css" />
<link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
    rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<!--<link href="css/styles.css" rel="stylesheet" />-->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">

        <div class="logo me-auto">
            <h1><a href="index.html">Online Quiz</a></h1>
        </div>

        <nav id="navbar" class="navbar order-last order-lg-0 ">
            <ul class="d-flex justify-content-center align-items-center">
                <li><a class="nav-link scrollto active" href="home">Home</a></li>
                <li><a class="nav-link scrollto" href="ranking">Ranking</a></li>

                <c:if test="${sessionScope.user ne null}">
                    <c:if test="${sessionScope.user.userRole ne 'User'}">
                        <li class="dropdown"><a href="#"><span>Management</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="users">User</a></li>
                                <li><a href="tests">Test</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="change-password">Change password</a></li>
                </c:if>


            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

        <div class="">
            <c:if test="${sessionScope.user eq null}">
                <a class="btn btn-primary ms-3 me-1" href="login">Login</a>
                <a class="btn btn-secondary" href="register">Register</a>     
            </c:if>
            <c:if test="${sessionScope.user ne null}">
                <a class="btn btn-danger" href="logout">Logout</a>     
            </c:if>
        </div>

    </div>
</header><!-- End Header -->
