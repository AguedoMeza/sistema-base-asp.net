﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master_pages/MasterPage.master" AutoEventWireup="true" CodeFile="perfiles.aspx.cs" Inherits="usuarios_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <title>Perfiles</title>

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
            z-index: 10000;
        }

        .table th {
            text-align: center;
        }
         .page-header {
    padding-bottom: 0px;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="row">
        <div class="col-lg-12">
            <%--<div class="panel panel-default">
                        <div class="panel-heading">--%>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Catalogo de Perfiles
                        </h1>
                    <%-- inicio modal prueba :V  --%>



                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <%--<br />--%>
                            <asp:Button ID="btnPopUp" runat="server" Text="Nuevo Perfil" class="btn btn-primary" OnClick="btnPopUp_Click" />

                            <br />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <asp:Button ID="btnInicial" runat="server" Text="Button" Style="display: none" />

                    <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server"
                        DynamicServicePath="" Enabled="True" TargetControlID="btnInicial"
                        BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
                    </asp:ModalPopupExtender>

                    <asp:Panel ID="PanelModal" runat="server" Style="display: none; background: white; width: 80%; height: auto">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h3 id="myModalLabel">Perfiles</h3>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid well">
                                        <div class="row-fluid">


                                            <div class="span4 ">
                                                <%-- Inicio de formulario men :v --%>
                                                <asp:Panel ID="pn_nombre" runat="server" class="form-group">
                                                    <asp:TextBox ID="txtNombre" runat="server" class="form-control"
                                                        placeholder="Nombre" TabIndex="4" ValidationGroup="val4">  </asp:TextBox>
                                                <%--</asp:Panel>--%>

                                               <%-- <asp:Panel ID="pn_ap_paterno" runat="server" class="form-group">
                                                    <asp:TextBox ID="txtAp_paterno" runat="server" class="form-control"
                                                        placeholder="Apellido Paterno" TabIndex="4" ValidationGroup="val4"></asp:TextBox>
                                                </asp:Panel>--%>

                                               <%-- <asp:Panel ID="pn_empresas" runat="server" class="form-group">--%>
                                                    <asp:DropDownList ID="ddlist_empresas" runat="server" class="form-control"></asp:DropDownList>
                                                </asp:Panel>

                                              </div>

                                            <%-- fin de formulario men :v--%>
                                        </div>


                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnClose" runat="server" Text="Cerrar" class="btn"
                                        data-dismiss="modal" aria-hidden="true" OnClick="btnClose_Click" ControlStyle-CssClass="btn btn-danger" />

                                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" class="btn"
                                        data-dismiss="modal" aria-hidden="true" OnClick="btnLimpiar_Click" ControlStyle-CssClass="btn btn-success" />

                                    <asp:Button ID="btn_registrar_actualizar" runat="server" Text="Registrar" class="btn"
                                        data-dismiss="modal" aria-hidden="true" OnClick="btnGuardar_Click" ControlStyle-CssClass="btn btn-primary" />

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>


                    </asp:Panel>

                    <%--  Terminacion modal prueba :V  --%>
                                    </br>
                                    <form role="form" id="form1">
                                        <div class="table-responsive">

                                            <asp:GridView ID="GridView1" runat="server" DataKeyNames="#" ControlStyle-CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand1">
                                                <Columns>
                                                    <asp:BoundField DataField="#" HeaderText="ID" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="Nombre" ItemStyle-HorizontalAlign="Center" HeaderText="Nombre">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>

                                                    <%--<asp:BoundField DataField="CURP" ItemStyle-HorizontalAlign="Center" HeaderText="CURP" />--%>
                                                    <asp:BoundField DataField="Empresa" ItemStyle-HorizontalAlign="Center" HeaderText="Empresa" />
                                                   <%-- <asp:BoundField DataField="Usuario" ItemStyle-HorizontalAlign="Center" HeaderText="Usuario" />--%>

                                                    <asp:TemplateField  HeaderText="Actualizar">
                                                      <ItemTemplate>
                                                        <asp:Button ID="AddButton" runat="server" 
                                                          CommandName="Actualizar" ControlStyle-CssClass="btn btn-success" text="Actualizar " 
                                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" 
                                                          enabled='<%# Convert.ToBoolean(Eval("activo")) %>'  ToolTip="Active registro para actualizar"/>
                                                      </ItemTemplate> 
                                                    </asp:TemplateField>


                                                    <%--   <asp:CheckBoxField DataField="Activo" HeaderText="Activo" ItemStyle-HorizontalAlign="Center"/>--%>

                                                    <asp:TemplateField HeaderText="Activo" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkStatus" runat="server"
                                                                AutoPostBack="true" OnCheckedChanged="chkStatus_OnCheckedChanged"
                                                                Checked='<%# Convert.ToBoolean(Eval("activo")) %>'
                                                                Text='<%# Eval("activo").ToString().Equals("True") ? "" : "" %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>




                                            </asp:GridView>

                                        </div>

                                        <!--Delete Record Modal Ends here -->
                </div>
                </form>
                                   
                                     
                                
                                <!-- /.col-lg-6 (nested) -->
            </div>
            <!-- /.row (nested) -->

        </div>

        <!-- /.panel-body -->
    </div>

    <!-- /.panel -->
    </div>
                <!-- /.col-lg-12 -->
    </div>
            <!-- /.row -->



</asp:Content>

