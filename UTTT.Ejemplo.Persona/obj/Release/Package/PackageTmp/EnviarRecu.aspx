<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnviarRecu.aspx.cs" Inherits="UTTT.Ejemplo.Persona.EnviarRecuperacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperar Contraseña</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
        <link href="https://www.flaticon.es/svg/vstatic/svg/615/615075.svg?token=exp=1618274989~hmac=a39b988f7e060537bb61b7bff5d14e3f" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />
        
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server" class="form-horizontal container">
        <br /><br />
        <div class="container well">
            <div style="font-family: Arial; font-size: medium; font-weight: bold;" class="col-auto">
                <h1 align="center" class="display-5">Recuperar Contraseña</h1>
            </div>
            <br /><br /><br /><br />
        <%--Inicia Correo--%>
            <div class="row ">
                <label class="col-sm-auto col-form-label">Correo Electronico:</label>
                <asp:TextBox CssClass="form-control col-auto" placeholder="Ingresa tu correo" ID="txtCorreo" runat="server" Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Debe ingresar un Correo"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1"
                    runat="server"
                    ControlToValidate="txtCorreo"
                    ErrorMessage="Email incorrecto"
                    ForeColor="Blue"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            

            </div>
            <br />
        

            <div class="col-auto" align="center">
                    <asp:Button
                        ID="btnAceptar"
                        runat="server"
                        Text="Aceptar"
                        
                        ViewStateMode="Disabled"
                        CssClass="btn btn-outline-success col-auto" OnClick="btnAceptar_Click" />
                
                    <asp:Button CssClass="btn btn-outline-primary " OnClientClick="return comprueba();" ID="btnCancelar" runat="server" Text="Cancelar"  ViewStateMode="Disabled" OnClick="btnCancelar_Click"  />
                    <br />
            </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function comprueba() {
        
    }
</script>