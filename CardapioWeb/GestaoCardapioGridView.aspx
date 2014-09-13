<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GestaoCardapioGridView.aspx.cs" Inherits="GestaoCardapioGridView" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar itens do cardápio</title>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500|Arvo:700' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/modernizr.custom.79639.js"></script>
    <!--[if lte IE 8]><style>.support-note .note-ie{display:block;}</style><![endif]-->
</head>
<body>
    <div class="container">

        <header>

            <div class="support-note">
                <!-- let's check browser support with modernizr -->
                <span class="no-cssanimations">CSS animations não suportado neste navegador.</span>
                <span class="no-csstransforms">CSS transforms não suportado neste navegador.</span>
                <span class="no-csstransforms3d">CSS 3D transforms não suportado neste navegador.</span>
                <span class="no-csstransitions">CSS transitions não suportado neste navegador.</span>
                <span class="note-ie">Desculpe, somente em navegadores mais atualizados.</span>
            </div>

        </header>

        <section class="main">

            <section class="af-wrapper">
                <h3>Itens do Cardápio</h3>

                <form class="af-form" runat="server" novalidate>
                    <div>
                        <asp:GridView ID="atributos_gv" runat="server"
                            AutoGenerateColumns="False" CellPadding="3" DataKeyNames="ID" DataSourceID="ObjectDataSource"
                            ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDataBound="atributos_gv_RowDataBound"
                            ShowHeaderWhenEmpty="True" Width="600px" AllowPaging="True">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="editar_img" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="editar" ImageUrl="~/images/Edit_16.png" ToolTip="Editar"
                                            OnClick="editar_img_Click" Style="margin-left: 5px;" />

                                        <asp:ImageButton ID="excluir_img" runat="server" CommandArgument='<%# Eval("ID") %>'
                                            CommandName="excluir" ImageUrl="~/images/delete_16.png" ToolTip="Excluir"
                                            OnClick="excluir_img_Click" OnClientClick="return confirm('Deseja excluir o Item do Cardápio?')" Style="margin-left: 5px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                                <asp:TemplateField HeaderText="Tipo">
                                    <ItemTemplate>
                                        <asp:Label ID="tipo_lbl" runat="server" Text='<%# Eval("Tipo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataRowStyle BackColor="White" Font-Size="Small" ForeColor="#083047" HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                Nenhum registro encontrado!
                            </EmptyDataTemplate>
                            <HeaderStyle BackColor="#083047" Font-Size="9pt" ForeColor="White" Height="25px" />
                            <PagerStyle BackColor="#083047" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#DDE6F7" Font-Size="9pt" ForeColor="Black" Height="22px" HorizontalAlign="Center"
                                Wrap="True" />
                            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" />
                            <AlternatingRowStyle BackColor="#EFF3FB" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource" runat="server" SelectMethod="buscaLista" TypeName="Library"></asp:ObjectDataSource>

                        <asp:Button ID="btnNovo" Text="Novo" runat="server" OnClick="btnNovo_Click" />
                    </div>
                </form>
            </section>

        </section>

    </div>
</body>
</html>
