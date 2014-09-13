using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GestaoCardapio : System.Web.UI.Page
{
    private string SessionList = "ListaSession";
    private string SessionObj = "SessionItemCardapio";

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
                    Session[SessionList] = lista;
                }
                else
                {
                    List<ItemCardapio> lista = new List<ItemCardapio>();
                    Session[SessionList] = lista;
                }

                switch (Convert.ToInt16(Request.QueryString.Get("mode")))
                {
                    case 1: // Novo
                        Session[SessionObj] = null;
                        break;
                    case 2: // Editar
                        if (Session[SessionObj] != null)
                        {
                            ItemCardapio modelo = (ItemCardapio)Session[SessionObj];
                            if (modelo != null)
                            {
                                PopularInterface(modelo);
                            }
                        }
                        break;
                    default:
                        Session[SessionObj] = null;
                        break;

                }
            }
        }
        catch (Exception exp) { }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        if (Session[SessionObj] == null)
        {
            ItemCardapio item = new ItemCardapio();
            item.ID = DateTime.Now.Ticks.ToString();
            item.Nome = nome_txt.Text;
            item.Descricao = descricao_txt.Text;

            if (!string.IsNullOrEmpty(tipo_drp.SelectedValue))
            {
                item.Tipo = (TipoItem)Convert.ToInt32(tipo_drp.SelectedValue);
            }

            if (Upload.HasFile)
            {
                string path = HttpContext.Current.Server.MapPath("~/images");
                if (!string.IsNullOrEmpty(path))
                {
                    string fileName = Upload.FileName.Replace(" ", "");
                    item.NomeImagem = "images/" + fileName;

                    Upload.SaveAs(Path.Combine(path, fileName));
                }
            }

            if (Session[SessionList] != null)
            {
                List<ItemCardapio> lista = (List<ItemCardapio>)Session[SessionList];
                if (lista != null)
                {
                    lista.Add(item);
                    string xml = Library.Serializar(lista);
                    if (!string.IsNullOrEmpty(xml))
                    {
                        if (Library.SalvarXml(xml))
                        {
                            Session[SessionObj] = null;
                            Response.Redirect("GestaoCardapioGridView.aspx");
                        }
                    }
                }
            }
        }
        else
        {
            ItemCardapio item = (ItemCardapio)Session[SessionObj];
            item.Nome = nome_txt.Text;
            item.Descricao = descricao_txt.Text;
            if (!string.IsNullOrEmpty(tipo_drp.SelectedValue))
            {
                item.Tipo = (TipoItem)Convert.ToInt32(tipo_drp.SelectedValue);
            }

            if (Upload.HasFile)
            {
                string path = HttpContext.Current.Server.MapPath("~/images");
                if (!string.IsNullOrEmpty(path))
                {
                    string fileName = Upload.FileName.Replace(" ", "");
                    item.NomeImagem = "images/" + fileName;

                    Upload.SaveAs(Path.Combine(path, fileName));
                }
            }

            if (Session[SessionList] != null)
            {
                List<ItemCardapio> lista = (List<ItemCardapio>)Session[SessionList];
                if (lista != null)
                {
                    ItemCardapio modelo = lista.FirstOrDefault(i => i.ID == item.ID);
                    if (modelo != null)
                    {
                        if (lista.Remove(modelo))
                        {
                            lista.Add(item);
                            string xml = Library.Serializar(lista);
                            if (!string.IsNullOrEmpty(xml))
                            {
                                if (Library.SalvarXml(xml))
                                {
                                    Session[SessionObj] = null;
                                    Response.Redirect("GestaoCardapioGridView.aspx");
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /* Limpa os campos da interface */
    private void limparCampos(ControlCollection controles)
    {
        try
        {
            foreach (Control componente in controles)
            {
                if (componente.Controls.Count > 0)
                {
                    limparCampos(componente.Controls);
                }
                else
                {
                    if (componente.GetType() == typeof(TextBox))
                        ((TextBox)componente).Text = string.Empty;
                    else if (componente.GetType() == typeof(DropDownList))
                        ((DropDownList)componente).SelectedIndex = -1;
                }
            }
        }
        catch (Exception) { throw; }
    }

    /* Popular Interface */
    private void PopularInterface(ItemCardapio item)
    {
        try
        {
            if (item != null)
            {
                nome_txt.Text = item.Nome;
                descricao_txt.Text = item.Descricao;
                tipo_drp.SelectedValue = Convert.ToInt32(item.Tipo).ToString();
            }
        }
        catch (Exception) { throw; }
    }
}