<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cardápio Digital</title>
    <%--<meta name="description" content="A responsive folded flyer-like restaurant menu with some 3D" />
        <meta name="keywords" content="css3, perspective, 3d, jquery, transform3d, responsive, template, restaurant, menu, leaflet, folded, flyer, concept" />
        <meta name="author" content="Codrops" />--%>
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,500|Arvo:700' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/modernizr.custom.79639.js"></script>
    <!--[if lte IE 8]><style>.support-note .note-ie{display:block;}</style><![endif]-->
</head>
<body>

    <form runat="server">

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

                <div id="rm-container" class="rm-container">

                    <div class="rm-wrapper">

                        <div class="rm-cover">

                            <div class="rm-front">
                                <div class="rm-content">

                                    <div class="rm-logo"></div>
                                    <h2>Restaurante Spoleto</h2>
                                    <h3>Restaurante &amp; Espaço para Eventos</h3>

                                    <a href="#" class="rm-button-open">Ver cardápio</a>
                                    <div class="rm-info">
                                        <p>
                                            <strong>Spoleto Restaurante</strong><br>
                                            Av. Nestor de Moura Jardim, Nº. 1550<br>
                                            Bairro Fátima - Guaíba/RS<br>
                                            <strong>Telefone</strong> +55 51 3378 7878<br>
                                            <strong>E-mail</strong>  <a href="mailto:specolin@specolin.com.br">specolin@specolin.com.br</a>
                                        </p>
                                    </div>

                                </div>
                                <!-- /rm-content -->
                            </div>
                            <!-- /rm-front -->

                            <div class="rm-back">
                                <div class="rm-content">
                                    <h4>Aperitivos</h4>
                                    <dl>
                                        <asp:ListView runat="server" ID="aperitivos_list">
                                            <ItemTemplate>
                                                <dt><a href="" class="rm-viewdetails" data-thumb="<%# Eval("NomeImagem") %>"><%# Eval("Nome") %></a></dt>
                                                <dd><%# Eval("Descricao") %></dd>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </dl>

                                    <h4>Bebidas</h4>
                                    <dl>
                                        <asp:ListView runat="server" ID="bebidas_list">
                                            <ItemTemplate>
                                                <dt><a href="" class="rm-viewdetails" data-thumb="<%# Eval("NomeImagem") %>"><%# Eval("Nome") %></a></dt>
                                                <dd><%# Eval("Descricao") %></dd>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </dl>
                                </div>
                                <!-- /rm-content -->
                                <div class="rm-overlay"></div>

                            </div>
                            <!-- /rm-back -->

                        </div>
                        <!-- /rm-cover -->

                        <div class="rm-middle">
                            <div class="rm-inner">
                                <div class="rm-content">
                                    <h4>Pratos Principais</h4>
                                    <dl>
                                        <asp:ListView runat="server" ID="pratosPrincipais_list">
                                            <ItemTemplate>
                                                <dt><a href="" class="rm-viewdetails" data-thumb="<%# Eval("NomeImagem") %>"><%# Eval("Nome") %></a></dt>
                                                <dd><%# Eval("Descricao") %></dd>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </dl>
                                </div>
                                <!-- /rm-content -->
                                <div class="rm-overlay"></div>
                            </div>
                            <!-- /rm-inner -->
                        </div>
                        <!-- /rm-middle -->

                        <div class="rm-right">

                            <div class="rm-front">
                            </div>

                            <div class="rm-back">
                                <!-- Fechar, retorna para a div principal -->
                                <span class="rm-close">Fechar</span>
                                <div class="rm-content">
                                    <h4>Sobremesas</h4>
                                    <dl>
                                        <asp:ListView runat="server" ID="sobremesas_list">
                                            <ItemTemplate>
                                                <dt><a href="" class="rm-viewdetails" data-thumb="<%# Eval("NomeImagem") %>"><%# Eval("Nome") %></a></dt>
                                                <dd><%# Eval("Descricao") %></dd>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </dl>
                                    <div class="rm-order">
                                        <p>
                                            <strong>Gostaria de fazer o seu evento em nosso espaço?<br />
                                            </strong>Ligue! Nós te ajudamos<br />
                                            <strong>+55 51 3378 7878</strong>
                                        </p>
                                    </div>
                                </div>
                                <!-- /rm-content -->
                            </div>
                            <!-- /rm-back -->

                        </div>
                        <!-- /rm-right -->
                    </div>
                    <!-- /rm-wrapper -->

                </div>
                <!-- /rm-container -->

            </section>

        </div>

    </form>
    <!-- jQuery if needed -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
    <script type="text/javascript">
        $(function () {

            Menu.init();

        });
    </script>
</body>
</html>

<%--<asp:ListView runat="server" ID="songlist" Style="margin: 40px;" DataKeyNames="Rev" OnSelectedIndexChanged="songlist_SelectedIndexChanged">
                        <ItemTemplate>
                            <div style="border-bottom: 1px solid; border-bottom-color: #C7C7C7; height: 50px;">
                                <table style="width: 100%; height: 100%;">
                                    <tr onmouseover="this.style.background='#E0EFFF';" onmouseout="this.style.background='transparent'">
                                        <td style="width: 50px;">
                                            <div class="musicthumbnail" onclick="updateSource('<%# Eval("Share.Url") %>', '<%#Container.DisplayIndex + 1 %>');" />
                                        </td>
                                        <td>
                                            <span id="music<%#Container.DisplayIndex + 1 %>" title="<%# Eval("Share.Url") %>" style="color: Black; font-size: 14px; margin-left: 10px;"><%#Eval("Name")%></span>
                                        </td>
<td style="width: 100px; color: #333;">
    <a href="#"><i style="float: right; margin-right: 5px;" class="fa fa-download"></i></a>
    <a href="#"><i style="float: right; margin-right: 10px;" class="fa fa-file-text-o"></i></a>

</td>
</tr>
                                </table>
                            </div>
                        </ItemTemplate>
                        <selecteditemtemplate>
                            <asp:Label ID="name_lbl" runat="server" Text='<%#Eval("Name") %>'> </asp:Label>
                        </selecteditemtemplate>

</asp:ListView>--%>
