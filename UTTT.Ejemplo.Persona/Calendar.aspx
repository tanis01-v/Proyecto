<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Calendar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
.table{border-collapse:collapse!important}.mb-0,.my-0{margin-bottom:0!important}.table{width:100%;margin-bottom:1rem;background-color:transparent}.mb-0{margin-bottom:0!important}.table{--bs-table-bg:transparent;--bs-table-striped-color:#212529;--bs-table-striped-bg:rgba(0, 0, 0, 0.05);--bs-table-active-color:#212529;--bs-table-active-bg:rgba(0, 0, 0, 0.1);--bs-table-hover-color:#212529;--bs-table-hover-bg:rgba(0, 0, 0, 0.075);width:100%;margin-bottom:1rem;color:#212529;vertical-align:top;border-color:#dee2e6}*,::after,::before{text-shadow:none!important;box-shadow:none!important}*,::after,::before{box-sizing:border-box}*,::after,::before{box-sizing:border-box}th{text-align:inherit}th{text-align:inherit;text-align:-webkit-match-parent}a{color:#007bff;text-decoration:none;background-color:transparent;-webkit-text-decoration-skip:objects}a{color:#0d6efd;text-decoration:underline}
        .auto-style1 {
            width: 874px;
            border-collapse: collapse;
        }
        .auto-style2 {
            border-style: solid;
            border-color: inherit;
            border-width: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="dd-MM-yyyy" PopupPosition="BottomRight"  BehaviorID="CalendarExtender" PopupButtonID="btnCa" TargetControlID="TextBox1" />
             <asp:ImageButton ID="btnCa" runat="server" Height="25px" ImageUrl="~/Images/cal.png" Width="25px" />
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <ajaxToolkit:ComboBox ID="ddl"  runat="server" DataSourceID="SqlDataSource1" DataTextField="strValor" DataValueField="id" MaxLength="0" OnSelectedIndexChanged="ddl_SelectedIndexChanged" style="display: inline;">
        </ajaxToolkit:ComboBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PersonaTanisConnectionString %>" SelectCommand="SELECT * FROM [CatEstadoCivil]"></asp:SqlDataSource>
        <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="id" DataValueField="id" MaxLength="0" style="display: inline;">
        </ajaxToolkit:ComboBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PersonaTanisConnectionString %>" SelectCommand="SELECT * FROM [CatSexo]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
       <%-- <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>--%>
        <br />
        <br />
                <%--<asp:GridView
                    ID="dgvPersonas"
                    runat="server"
                    AllowPaging="True"
                    AutoGenerateColumns="False"
                    CellPadding="3"
                    DataSourceID="DataSourcePersona"
                    OnRowCommand="dgvPersonas_RowCommand"
                    OnSelectedIndexChanged="dgvPersonas_SelectedIndexChanged"
                    ViewStateMode="Disabled"
                    Width="874px"
                    class="table  table-striped  table-hover  table-sm table mb-0 "
                    HorizontalAlign="Left">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica" ReadOnly="True" SortExpression="strClaveUnica" />
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True" SortExpression="strNombre" />
                        <asp:BoundField DataField="strAPaterno" HeaderText="Apellido paterno" ReadOnly="True" SortExpression="strAPaterno" />
                        <asp:BoundField DataField="strAMaterno" HeaderText="Apellido materno" ReadOnly="True" SortExpression="strAMaterno" />
                        <asp:BoundField DataField="CatSexo" HeaderText="Sexo" SortExpression="CatSexo" />
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
                        <asp:TemplateField HeaderText="Direccion">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgDireccion" runat="server" CommandArgument='<%#Bind("id") %>' CommandName="Direccion" ImageUrl="~/Images/editrecord_16x16.png" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>--%>
            <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
