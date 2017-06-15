<%@ Page Title="" Language="C#" MasterPageFile="~/master_pages/MasterPage.master" AutoEventWireup="true" CodeFile="modulos_funciones.aspx.cs" Inherits="usuarios_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Modulos Acciones</title>

    <style type="text/css">
           .modalBackground 
            {
                background-color: Black;
                filter: alpha(opacity=90);
                opacity: 0.8;
                z-index: 10000;
            }
        .table th {
            text-align: center;
        }
        /*clase para cambiar el hover del textbox al hacer clic*/
       .form-control2:focus {border-color:rgb(255, 0, 0)!important;
-webkit-box-shadow: none!important;
    -moz-box-shadow: none!important;
    box-shadow: none!important;
}
        /*clase para sobreescribir la original y cambiar el color del borde*/
        .form-control2 {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image:none;
    border: 1px solid #b73a3a;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
    

       
           
           
          
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
            <div class="row">
                <div class="col-lg-12">
                    <%--<div class="panel panel-default">
                        <div class="panel-heading">--%>
                 
                           
					  
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                      <h1 class="page-header">Catalogo de Modulos Funciones</h1>
                                      <%-- inicio modal prueba :V  --%>
        
        
       
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <%--    <br />--%>
                  <asp:Button ID="btnPopUp" runat="server" Text="Nueva" class="btn btn-primary" OnClick="btnPopUp_Click" />
                        
<br />
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none" />

            <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="btnInicial" 
                BackgroundCssClass="modalBackground" PopupControlID="PanelModal">
            </asp:ModalPopupExtender>

            <asp:Panel ID="PanelModal" runat="server" style="display:none; background:white; width:80%; height:auto">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Modulos Funciones</h3>
              </div>
              <div class="modal-body">
                    <div class="container-fluid well">
                        <div class="row-fluid">

                           
                            <div class="span4 ">
                                <%-- Inicio de formulario men :v --%>
                                <asp:Panel ID="pn_nombre" runat="server" class="form-group">


                                           <%-- <asp:TextBox ID="txtDefinicion" runat="server" class="form-control" 
                                            placeholder="Definición" TabIndex="4" ValidationGroup="val4">  </asp:TextBox>--%>
                             
                       
                                     <asp:DropDownList ID="ddlist_modulos" runat="server" class="form-control" ></asp:DropDownList>
                                    <asp:DropDownList ID="ddlist_acciones" runat="server" class="form-control" ></asp:DropDownList>
                              
                                    
                           
                                    

                                </asp:Panel>
                                
                            </div>

                           <%-- fin de formulario men :v--%>
                        
                            </div>
                        
                        
                    </div>
                  
              </div>
              <div class="modal-footer">
                  <asp:Button ID="btnClose" runat="server" Text="Cerrar" class="btn" 
                      data-dismiss="modal" aria-hidden="true" onclick="btnClose_Click" ControlStyle-CssClass="btn btn-danger"/>

                  <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" class="btn" 
                      data-dismiss="modal" aria-hidden="true" onclick="btnLimpiar_Click"  ControlStyle-CssClass="btn btn-success"/>

                   <asp:Button ID="btn_registrar_actualizar" runat="server" Text="Registrar" class="btn" 
                      data-dismiss="modal" aria-hidden="true" onclick="btnGuardar_Click" ControlStyle-CssClass="btn btn-primary" />
               
              </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                
            </asp:Panel>
        
       <%--  Terminacion modal prueba :V  --%>
                                    </br>
                                    <form role="form" id="form1">
                                        <div  class="table-responsive">
                                     
                                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id"  ControlStyle-CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand1">
                                            <Columns>
                                               <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-HorizontalAlign="Center"  HeaderStyle-HorizontalAlign="Center"/>
                                                <asp:BoundField DataField="Funciones" ItemStyle-HorizontalAlign="Center"  HeaderText="Funciones">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                    
                                                <asp:BoundField DataField="Modulos" ItemStyle-HorizontalAlign="Center"  HeaderText="Modulo" />
                                              <%-- <asp:BoundField DataField="Acciones" ItemStyle-HorizontalAlign="Center"   HeaderText="Accion" />--%>
                                              
                                             
                                              <asp:ButtonField ButtonType="Button" CommandName="Actualizar"
                                    HeaderText="Editar" Text="Actualizar"  ControlStyle-CssClass="btn btn-success" ItemStyle-HorizontalAlign="Center" />


                                             
                                              
                                             <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderText="Activo" >
                                                <ItemTemplate >
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
                              <%--  <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>--%>
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

