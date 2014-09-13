<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GestaoCardapio.aspx.cs" Inherits="GestaoCardapio" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item do cardápio</title>
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
                <h3>Item do Cardápio</h3>

                <form class="af-form" runat="server" novalidate>

                    <div class="af-outer af-required">
                        <div class="af-inner">
                            <asp:FileUpload ID="Upload" runat="server" />
                        </div>
                    </div>

                    <div class="af-outer af-required">
                        <div class="af-inner">
                            <label for="input-nome">Nome</label>
                            <asp:TextBox ID="nome_txt" MaxLength="60" runat="server" />
                        </div>
                    </div>

                    <div class="af-outer af-required">
                        <div class="af-inner">
                            <label for="input-descricao">Descrição</label>
                            <asp:TextBox ID="descricao_txt" MaxLength="100" runat="server" TextMode="MultiLine" />
                        </div>
                    </div>

                    <div class="af-outer af-required">
                        <div class="af-inner">
                            <label for="input-area">Área no Cardápio</label>
                            <asp:DropDownList ID="tipo_drp" runat="server">
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Aperitivo" Value="0" />
                                <asp:ListItem Text="Bebida" Value="1" />
                                <asp:ListItem Text="Prato Principal" Value="2" />
                                <asp:ListItem Text="Sobremesa" Value="3" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <asp:Button ID="btnEnviar" Text="Enviar" runat="server" OnClick="btnEnviar_Click" Style=""/>

                </form>
            </section>

        </section>

    </div>
</body>
</html>
