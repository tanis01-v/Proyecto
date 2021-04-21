 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug=false%> <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <script src="Scripts/validar.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
        <link href="https://www.flaticon.es/svg/vstatic/svg/41/41771.svg?token=exp=1618274917~hmac=7e9be52f3e7342aafc4427c6ff05e88b" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />
        
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <%--Inicia Formulario--%>
    <form id="form1" runat="server" class="form-horizontal container">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container well">
            <div style="font-family: Arial; font-size: medium; font-weight: bold;" class="col-auto">
                <h1 align="center" class="display-5">Persona</h1>
            </div>
            <%--Inicia Texto accion--%>
            <div class="col-auto" align="center">
                <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True"></asp:Label>
            </div>
            <br />

            <%--Inicia Sexo--%>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row ">
                        <label class="col-sm-2 col-form-label">Sexo:</label>
                        <asp:DropDownList align="center" CssClass="form-control col-auto" ID="ddlSexo" runat="server" Height="48px" Width="320px" ></asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Debe escoger un sexo" EnableClientScript="False" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlSexo" EventName="SelectedIndexChanged" />
                </Triggers>


            </asp:UpdatePanel>


            <br />
            <%--Inicia Clave Unica --%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Clave Unica:</label>
                <asp:TextBox CssClass="form-control col-sm-auto" placeholder="Ingresa tu Clave Unica" ID="txtClaveUnica" MinLength="3" MaxLength="3" runat="server" Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Debe ingresar la Clave Unica"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    CssClass="col-auto"
                    ID="RegularExpressionValidator2"
                    runat="server"
                    ControlToValidate="txtClaveUnica"
                    ErrorMessage="Solo se aceptan numeros"
                    ForeColor="Blue"
                    ValidationExpression="([0-9]|-)*"></asp:RegularExpressionValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Aceptamos valores de 100 a 999" MaximumValue="999" MinimumValue="100"></asp:RangeValidator>
            </div>

            <%--Inicia Nombre--%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Nombre:</label>
                <asp:TextBox CssClass="form-control col-auto" placeholder="Ingresa tu nombre" ID="txtNombre" MinLength="3" MaxLength="15" runat="server" Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNombre" ErrorMessage="Debe ingresar un Nombre"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="col-auto"
                    ID="RegularExpressionValidator7"
                    runat="server"
                    ControlToValidate="txtNombre"
                    ErrorMessage="Solo se acepta letras y un rango de 3 a 15 caracteres"
                    ForeColor="Blue"
                    ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1])[a-zA-ZÀ-ÿ\u00f1\u00d1]+$"></asp:RegularExpressionValidator>
            </div>

            <%--Inicia Apellido Paterno--%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Apellido Paterno:</label>
                <asp:TextBox CssClass="form-control col-auto" placeholder="Ingresa tu Apellido Paterno" ID="txtAPaterno" MinLength="3" MaxLength="15" runat="server" Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="Debe ingresar un Apellido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    CssClass="col-auto"
                    ID="RegularExpressionValidator5"
                    runat="server"
                    ControlToValidate="txtAPaterno"
                    ErrorMessage="Solo se acepta letras y un rango de 3 a 15 caracteres"
                    ForeColor="Blue"
                    ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1])[a-zA-ZÀ-ÿ\u00f1\u00d1]+$"></asp:RegularExpressionValidator>
            </div>

            <%--Inicia Apellido Materno--%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Apellido Materno:</label>
                <asp:TextBox CssClass="form-control col-auto" placeholder="Ingresa tu Apellido Materno" ID="txtAMaterno" MinLength="3" MaxLength="15" runat="server" Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAMaterno" ErrorMessage="Debe ingresar un Apellido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator4"
                    runat="server"
                    ControlToValidate="txtAMaterno"
                    ErrorMessage="Solo se acepta letras y un rango de 3 a 15 caracteres"
                    ForeColor="Blue"
                    ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1])[a-zA-ZÀ-ÿ\u00f1\u00d1]+$"></asp:RegularExpressionValidator>
            </div>

            <%--Inicia Estado Civil--%>

            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="row ">
                        <label class="col-sm-2 col-form-label">Estado Civil:</label>
                        <asp:DropDownList align="center" CssClass="form-control col-auto" ID="ddlExtadoCivil" runat="server" Height="48px" Width="320px"></asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Debe escoger un Estado civil" EnableClientScript="False" InitialValue="-1" ControlToValidate="ddlExtadoCivil"></asp:RequiredFieldValidator>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlExtadoCivil" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>

            <br />

            <%--Inicia Correo--%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Correo Electronico:</label>
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

            <%--Inicia Codigo postal--%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Codigo Postal:</label>
                <asp:TextBox CssClass="form-control col-auto" placeholder="Ingresa tu Codigo Postal" ID="txtCodigoPostal" runat="server" Width="320px" MaxLength="5" MinLength="5" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCodigoPostal" ErrorMessage="Debe ingresar un Codigo postal"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator3"
                    runat="server"
                    ControlToValidate="txtCodigoPostal"
                    ErrorMessage="Solo se aceptan numeros"
                    ForeColor="Blue"
                    ValidationExpression="([0-9]|-)*"></asp:RegularExpressionValidator>
            </div>

            <%--Inicia RFC --%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">RFC:</label>
                <asp:TextBox CssClass="form-control col-auto" placeholder="Ingresa tu RFC" ID="txtRFC" MaxLength="13" MinLength="12" runat="server" Width="320px" ViewStateMode="Disabled" BorderStyle="Dotted"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="col-auto" ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtRFC" ErrorMessage="Debe ingresar un RFC"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator6"
                    runat="server"
                    ControlToValidate="txtRFC"
                    ErrorMessage="Ingresa un RFC valido"
                    ForeColor="Blue"
                    ValidationExpression="^(([A-Z]|[a-z]|\s){1})(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))"></asp:RegularExpressionValidator>
            </div>

            <%--Inicia Fecha Nacimiento --%>
            <div class="row ">
                <label class="col-sm-2 col-form-label">Fecha Nacimiento:</label>
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" CssClass="form-control col-sm-auto" Width="280px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <asp:ImageButton CssClass="form-control col-sm-auto" ID="btnCa" runat="server" Height="35px" ImageUrl="~/Images/cal.png" Width="43px" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar una fecha"></asp:RequiredFieldValidator>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="dd/MM/yyyy" PopupPosition="BottomRight" BehaviorID="CalendarExtender" PopupButtonID="btnCa" TargetControlID="TextBox1" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fecha invalida" ForeColor="Blue" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{2,4}$"></asp:RegularExpressionValidator>
            </div>
            <%--Termina Fecha Nacimiento --%>
            <div class="row ">
                <br />
                <asp:Label class="col-sm-1 col-form-label" ID="lblMensaje" runat="server" Text="..."></asp:Label>
            </div>
            <br />

            <div class="col-auto" align="center">
                <asp:Button
                    ID="btnAceptar"
                    runat="server"
                    Text="Aceptar"
                    onsubmit="return validar();"
                    OnClick="btnAceptar_Click"
                    ViewStateMode="Disabled"
                    CssClass="btn btn-outline-success col-auto" />

                <asp:Button CssClass="btn btn-outline-primary " ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" ViewStateMode="Disabled" OnClientClick="return comprueba();" />
                <br />
            </div>
        </div>
        <div class="col-auto">
            <label></label>
        </div>
    </form>

</body>
</html>
<script type="text/javascript">
    function comprueba() {
        
    }
</script>
