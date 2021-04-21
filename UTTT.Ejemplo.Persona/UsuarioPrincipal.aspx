<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        <link href="https://www.flaticon.es/svg/vstatic/svg/64/64572.svg?token=exp=1618274989~hmac=69f4a05930f34842fd035d950bf9efcf" rel="icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />
        <title>Usuario Principal</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
    </head>
<body bgcolor="#F6D7D0">
        <%--Etiqueta--%>
        
        <form id="form1" runat="server" >
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="row">
                <asp:Button ID="Button1" align="right" runat="server" Text="Cerrar sesion" class="btn-close" OnClick="Button1_Click" Height="60px" Width="175px" />
                <asp:Button ID="Button2" class="btn btn-light" align="left" runat="server" Text="Home"   Height="60px" Width="175px" OnClick="Button2_Click" />
            </div>
            
            <div class="container well">
                <div style="font-family: Arial; font-size: medium; font-weight: bold;" class="col-auto">
                    <h1 align="center" class="display-5">Usuario</h1>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2">
                        <label class="col-form-label">Nombre de Usuario:  </label>
                    </div>
                    <div class="col-md-2">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <input type="submit" name="btnTrick" value="" id="btnTrick" style="display: none;" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="txtNombre"  EventName="TextChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                                <asp:TextBox CssClass="input-group-text form-control" ID="txtNombre" runat="server" Height="38px" Width="177px" ViewStateMode="Disabled" ></asp:TextBox>
                    </div>
                    <br />
                    <div class="col-md-1">
                        <label class="col-form-label">Estado:  </label>
                    </div>
                    <div class="col-md-2">
                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                    <ContentTemplate>
                            <asp:DropDownList align="center" CssClass="form-control col-auto" ID="ddlEstado" runat="server" Height="38px" Width="177px" ></asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlEstado" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                    </div>
                    
                    <br />
                    <div class="col-md-2" align="center">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar"  ViewStateMode="Disabled" CssClass="btn btn-outline-success " />
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar"  ViewStateMode="Disabled" CssClass="btn btn-outline-primary " OnClick="btnAgregar_Click" />
                    </div>
                </div>
           
            <br />
            <div style="font-weight: bold;" class="form-group">
                <p align="center" class="h4">Detalle</p>
            </div>
            
            
            <div class="table-responsive">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                <asp:GridView
                    ID="dgvUsuarios"
                    runat="server"
                    AllowPaging="True"
                    AutoGenerateColumns="False"
                    CellPadding="3"
                    DataSourceID="DataSourceUsuario"
                    ViewStateMode="Disabled"
                    Width="1067px"
                    class="table  table-striped  table-hover  table-sm table mb-0 "
                    HorizontalAlign="Left" 
                    OnRowCommand="dgvUsuarios_RowCommand" 
                    OnSelectedIndexChanged="dgvUsuarios_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="nombreUsuario" HeaderText="Nombre de Usuario" ReadOnly="True" SortExpression="nombreUsuario" />
                        <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" SortExpression="fecha" />
                        <asp:TemplateField HeaderText="Editar">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgEditar" runat="server" CommandArgument='<%#Bind("id") %>' CommandName="Editar" ImageUrl="~/Images/editrecord_16x16.png" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eliminar" Visible="True">
                            <ItemTemplate>
                                <asp:ImageButton
                                    ID="imgEliminar"
                                    runat="server"
                                    CommandArgument='<%#Bind("id") %>'
                                    CommandName="Eliminar"
                                    ImageUrl="~/Images/delrecord_16x16.png"
                                    OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" />
                            </ItemTemplate>
                            <HeaderStyle />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>
                        <asp:LinqDataSource ID="DataSourceUsuario" runat="server" ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" EntityTypeName="" Select="new (nombreUsuario, fecha,id)" TableName="Usuarioo" OnSelecting="DataSourceUsuario_Selecting">
                        </asp:LinqDataSource>
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

            
                </div>
        <script type="text/javascript">
        var nombre = document.getElementById("txtNombre").value;
        document.querySelector('#txtNombre').addEventListener('keyup', function () {
            const btnTrick = document.querySelector('#btnTrick');
            btnTrick.click();
        });
    </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        </form>
        </body>
</html>