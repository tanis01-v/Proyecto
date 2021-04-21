<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title></title>
         <script src="Scripts/validar.js"></script>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container well">
            <div style="font-family: Arial; font-size: medium; font-weight: bold;" class="col-auto">
                <h1 align="center" class="display-5">Usuario</h1>
            </div>
            <%--Inicia Texto accion--%>
            <div class="col-auto" align="center" >
                <asp:Label  ID="lblAccion"  runat="server" Text="Accion" Font-Bold="True"></asp:Label>
            </div>
                <br />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row ">
                            <label class="col-sm-2 col-form-label">Persona:</label>
                            <asp:DropDownList align="center" CssClass="form-control col-auto" ID="ddlPersonas" runat="server" Height="48px" Width="320px" OnSelectedIndexChanged="ddlPersonas_SelectedIndexChanged1"></asp:DropDownList>
                            <asp:RequiredFieldValidator  CssClass="col-auto" ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPersonas" ErrorMessage="Debe escoger una persona" EnableClientScript="False" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>

                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlPersonas" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
             

            <br />
            
            <%--Inicia Nombre usuario--%>
            <div class="row ">
                    <label class="col-sm-2 col-form-label" >Nombre de usuario:</label>
                    <asp:TextBox CssClass="form-control col-auto" placeholder="Ingresa tu nombre de usuario"  ID="txtNombreUsuario" MinLength="3" MaxLength="15" runat="server"  Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNombre" ErrorMessage="Debe ingresar un Nombre"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="col-auto"
                        ID="RegularExpressionValidator7"
                        runat="server"
                        ControlToValidate="txtNombre"
                        ErrorMessage="Solo se acepta letras y un rango de 3 a 15 caracteres"
                        ForeColor="Blue"
                        ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1])[a-zA-ZÀ-ÿ\u00f1\u00d1]+$"></asp:RegularExpressionValidator>--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="Ingresa un nombre de usuario"></asp:RequiredFieldValidator>
            </div>
            <br />

            <%--Inicia Contrasena--%>
            <div class="row ">
                    <label class="col-sm-2 col-form-label" >Contraseña:</label>
                    <asp:TextBox CssClass="form-control col-auto"  ID="txtContrasena" MinLength="3" MaxLength="15" runat="server"  Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted" type="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtContrasena" ErrorMessage="Ingresa una contraseña"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="row ">
                    <label class="col-sm-2 col-form-label" >Verificar contraseña:</label>
                    <asp:TextBox CssClass="form-control col-auto"  ID="txtContrasenaVerifi" MinLength="3" MaxLength="15" runat="server"  Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted" type="Password"></asp:TextBox>
            </div>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtContrasenaVerifi" ControlToValidate="txtContrasena" ErrorMessage="Las contraseñas deben ser iguales"></asp:CompareValidator>
            <br />
             <%--Inicia Estado --%>
                
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="row ">
                            <label class="col-sm-2 col-form-label">Estado:</label>
                            <asp:DropDownList align="center" CssClass="form-control col-auto" ID="ddlEstado" runat="server" Height="48px" Width="320px" ></asp:DropDownList>
                            <%--<asp:RequiredFieldValidator  CssClass="col-auto" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe escoger un Estado civil" EnableClientScript="False" InitialValue="-1" ControlToValidate="ddlExtadoCivil"></asp:RequiredFieldValidator>--%>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlEstado" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                
                <br />
            
            <%--Inicia Fecha --%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Fecha:</label>
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" CssClass="form-control col-sm-auto" Width="280px" ></asp:TextBox>
                <asp:ImageButton CssClass="form-control col-sm-auto" ID="btnCa" runat="server" Height="35px" ImageUrl="~/Images/cal.png" Width="43px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar una fecha"></asp:RequiredFieldValidator>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="MM/dd/yyyy" PopupPosition="BottomRight" BehaviorID="CalendarExtender" PopupButtonID="btnCa" TargetControlID="TextBox1" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fecha invalida" ForeColor="Blue" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{2,4}$"></asp:RegularExpressionValidator>
            </div>
            <%--Termina Fecha --%>
            <div class="row col-auto ">
                <br />
                <asp:Label class="col-sm-1 col-form-label" ID="lblMensaje" runat="server" Text="..."></asp:Label>
            </div>
            <br />

                <div class="col-auto" align="center">
                    <asp:Button
                        ID="btnAceptar"
                        runat="server"
                        Text="Aceptar"
                        
                        ViewStateMode="Disabled"
                        CssClass="btn btn-outline-success col-auto" OnClick="btnAceptar_Click" />
                
                    <asp:Button CssClass="btn btn-outline-primary " ID="btnCancelar" runat="server" Text="Cancelar"  ViewStateMode="Disabled" OnClick="btnCancelar_Click" OnClientClick="return comprueba();"/>
                    <br />
            </div>
                </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function comprueba() {
        
    }
</script>
