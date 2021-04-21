<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="UTTT.Ejemplo.Persona.inicio" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Inicio</title>
    <title>Personal Bootstrap Template</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="https://www.flaticon.com/svg/vstatic/svg/1946/1946436.svg?token=exp=1618274422~hmac=a89b94349bf52e4b08a6576fdadce5d2" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template URL: https://bootstrapmade.com/personal-free-resume-bootstrap-template/
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header">
        
          <%--<div runat="server">
            <asp:Button align="right" ID="btnCerrar" runat="server" Text="Cerrar sesion" class="btn-close"  Height="60px" Width="175px" OnClick="btnCerrar_Click" />
        </div>--%>
        <div class="container">

            <h1><a href="#">Bienvenido</a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
            <h2>Puedes ingresar a cualquier <span>sitio </span>deseado</h2>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link active" href="#" onclick="RedirectPersona();">Personas</a></li>
                    <li><a class="nav-link" href="#" onclick="RedirectUsuario();">Usuarios</a></li>

                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav>
            <!-- .navbar -->

        </div>
    </header>
    <!-- End Header -->
</body>
</html>
<script>
    function RedirectPersona() { location.href = "PersonaPrincipal.aspx"; }
    function RedirectUsuario() { location.href = "UsuarioPrincipal.aspx"; }
</script>
