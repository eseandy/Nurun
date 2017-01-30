<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="default.aspx.cs" Inherits="Nurun._default" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <li>
                    <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>

                    </li>
                    <li>Rol:  <asp:Label ID="lblRol" runat="server" Text=""></asp:Label></li>
                    <li class="current"><a href="default.aspx"><i class="glyphicon glyphicon-home"></i> Dashboard</a></li>
                    <li><a href="logout.aspx"><i class="glyphicon glyphicon-tasks"></i> Cerrar Sesión</a></li>

                </ul>
             </div>
		  </div>
		  <div class="col-md-10">

		  	<div class="row" id="DivRol1" runat="server">
		  		<div class="col-md-12">
		  			<div class="content-box-header panel-heading">
	  					<div class="panel-title ">Tarjetahabientes</div>
						
						<div class="panel-options">
							<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
							<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
						</div>
		  			</div>
		  			<div class="content-box-large box-with-header">
			  			                                      <asp:GridView ID="GridView1" DataSourceID="SqlDataSource1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                          <EditRowStyle BackColor="#999999" />
                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                          <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                          <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                          <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnection %>" 
                                            SelectCommand="SELECT [id_client]
                                                          ,[email_cli]
                                                          ,[name_cli]
                                                          ,[cuenta_cli]
                                                      FROM [dbo].[n_client]"
   UpdateCommand="UPDATE [n_client] SET 
         [email_cli] = @email_cli, [name_cli] = @name_cli, [cuenta_cli] = @cuenta_cli
         WHERE [id_client] = @id_client"

                                            InsertCommand="INSERT INTO [n_client] ([email_cli], [name_cli], [cuenta_cli])
         VALUES (@email_cli, @name_cli, @cuenta_cli)"


                                             >
                                              <UpdateParameters>
                                                <asp:Parameter Name="id_client" Type="Int32" />
                                                <asp:Parameter Name="email_cli" Type="String" />
                                                <asp:Parameter Name="name_cli" Type="String" />
                                                <asp:Parameter Name="cuenta_cli" Type="String" />
                                            </UpdateParameters>
                                              <InsertParameters>
                                                <asp:Parameter Name="email_cli" Type="String" />
                                                <asp:Parameter Name="name_cli" Type="String" />
                                                <asp:Parameter Name="cuenta_cli" Type="String" />
                                            </InsertParameters>
                                         </asp:SqlDataSource> <br /><br />
					</div>
		  		</div>
		  	</div>
		  	<div class="row" id="DivRol2" runat="server">
		  		<div class="col-md-12">
		  			<div class="content-box-header panel-heading">
	  					<div class="panel-title ">Transferencias bancarias</div>
						
						<div class="panel-options">
							<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
							<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
						</div>
		  			</div>
		  			<div class="content-box-large box-with-header">
			  				<div class="panel-body">
			  					<div class="form-horizontal" role="form">
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-2 control-label">Número de Cliente</label>
								    <div class="col-sm-10">
								      
                                            <asp:TextBox ID="txtidClient" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-2 control-label">Monto</label>
								    <div class="col-sm-10">
								      
                                            <asp:TextBox ID="txtAmount" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
								    
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-2 control-label">Descripción del Movimiento</label>
								    <div class="col-sm-10">
                                        <asp:TextBox ID="txtDesc" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
								    </div>
								  </div>
                                    <asp:Button ID="txtEnvuar" CssClass="btn btn-primary signup" runat="server" Text="Aplicar" OnClick="txtEnvuar_Click" />
								    <asp:Label ID="lblTrans" runat="server" Text=""></asp:Label>
                                  </div>
			  				</div>			  			    
                          
                          <br /><br />
					</div>
		  		</div>
		  	</div>
		  	<div class="row"  id="DivRol3" runat="server">
		  		<div class="col-md-12">
		  			<div class="content-box-header panel-heading">
	  					<div class="panel-title ">Historial de Movimientos en mi cuenta</div>
						
						<div class="panel-options">
							<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
							<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
						</div>
		  			</div>
		  			<div class="content-box-large box-with-header">
                        <asp:Label ID="lblidUser" runat="server" Text="" Visible="false"></asp:Label>
			  						  			                        <asp:GridView ID="GridView2" DataSourceID="SqlDataSource2" runat="server" AllowPaging="True" AllowSorting="True"  CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnection %>" 
                            SelectCommand="SELECT [id_trans]
                                           ,id_client
                                          ,[date_tran]
                                          ,[amount]
                                          ,[desc_tran]
                                      FROM [n_user_transaction]"
                            FilterExpression="id_client = {0}"
                                >
                            <FilterParameters>
                            <asp:ControlParameter Name="id_client" ControlID="lblidUser" PropertyName="Text" />
                            </FilterParameters>
                            </asp:SqlDataSource>
                          <br /><br />
					</div>
		  		</div>
		  	</div>
		  	<div class="content-box-large">

		  	</div>
		  </div>

            </div></div>

</asp:Content>
