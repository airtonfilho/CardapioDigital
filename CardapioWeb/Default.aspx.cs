using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {
                string xml = Library.BuscarXml();
                if (!string.IsNullOrEmpty(xml))
                {
                    List<ItemCardapio> lista = new List<ItemCardapio>();
                    lista = (List<ItemCardapio>)Library.Deserializar(xml, lista);

                    if ((lista != null) && (lista.Count > 0))
                    {
                        // Busca somente o Itens do Cardápio do Tipo 'Aperitivo'
                        IEnumerable<ItemCardapio> aperitivos = from item in lista
                                                               where item.Tipo == TipoItem.Aperitivo
                                                               select item;

                        aperitivos_list.DataSource = aperitivos.OrderBy(item => item.Nome);
                        aperitivos_list.DataBind();

                        // Busca somente o Itens do Cardápio do Tipo 'Bebida'
                        IEnumerable<ItemCardapio> bebidas = from item in lista
                                                            where item.Tipo == TipoItem.Bebida
                                                            select item;

                        bebidas_list.DataSource = bebidas.OrderBy(item => item.Nome);
                        bebidas_list.DataBind();

                        // Busca somente o Itens do Cardápio do Tipo 'Prato Princiapal'
                        IEnumerable<ItemCardapio> pratosPrincipais = from item in lista
                                                                     where item.Tipo == TipoItem.PratoPrincipal
                                                                     select item;

                        pratosPrincipais_list.DataSource = pratosPrincipais.OrderBy(item => item.Nome);
                        pratosPrincipais_list.DataBind();

                        // Busca somente o Itens do Cardápio do Tipo 'Sobremesa'
                        IEnumerable<ItemCardapio> sobremesas = from item in lista
                                                               where item.Tipo == TipoItem.Sobremesa
                                                               select item;

                        sobremesas_list.DataSource = sobremesas.OrderBy(item => item.Nome);
                        sobremesas_list.DataBind();
                    }
                }
            }
        }
        catch { }
    }
}