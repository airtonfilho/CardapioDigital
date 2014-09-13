using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GestaoCardapioGridView : System.Web.UI.Page
{
    private string corLinhaSelecionada = "#C6E2FF";
    private string corLinhaPrimeira = "#DDE6F7";
    private string corLinhaSegunda = "#EFF3FB";
    private string SessionObj = "SessionItemCardapio";

    protected void Page_Load(object sender, EventArgs e)
    {

    }
  
    protected void editar_img_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            List<ItemCardapio> auxList = Library.buscaLista();
            if ((auxList != null) && (auxList.Count > 0))
            {
                string codigo = ((ImageButton)sender).CommandArgument;
                if (!string.IsNullOrEmpty(codigo))
                {
                    ItemCardapio modelo = auxList.FirstOrDefault(item => item.ID == codigo);
                    if (modelo != null)
                    {
                        Session[SessionObj] = modelo;
                        Response.Redirect("GestaoCardapio.aspx?mode=2", true);
                    }
                }
            }
        }
        catch (Exception exp) { throw; }
    }
    protected void excluir_img_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            List<ItemCardapio> auxList = Library.buscaLista();
            if ((auxList != null) && (auxList.Count > 0))
            {
                string codigo = ((ImageButton)sender).CommandArgument;
                if (!string.IsNullOrEmpty(codigo))
                {
                    ItemCardapio modelo = auxList.FirstOrDefault(item => item.ID == codigo);
                    if (auxList.Remove(modelo))
                    {
                        string xml = Library.Serializar(auxList);
                        Library.SalvarXml(xml);

                        atributos_gv.DataBind();
                    }
                }
            }
        }
        catch (Exception) { throw; }
    }
    protected void atributos_gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.Footer)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='" + corLinhaSelecionada + "'");
                    if ((e.Row.DataItemIndex % 2) > 0)
                        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + corLinhaSegunda + "'");
                    else
                        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + corLinhaPrimeira + "'");
                }

                if ((e.Row.Cells[2].Controls.Count > 1) && (e.Row.Cells[2].Controls[1].GetType() == typeof(Label)))
                {
                    Label label = (Label)e.Row.Cells[2].Controls[1];
                    if ((label != null) && (!string.IsNullOrWhiteSpace(label.Text)))
                    {
                        switch (label.Text)
                        {
                            case "Aperitivo":
                                label.Text = "Aperitivo";
                                break;
                            case "Bebida":
                                label.Text = "Bebida";
                                break;
                            case "PratoPrincipal":
                                label.Text = "Prato Principal";
                                break;
                            case "Sobremesa":
                                label.Text = "Sobremesa";
                                break;
                        }
                    }
                }
            }
        }
        catch { }
    }
    protected void btnNovo_Click(object sender, EventArgs e)
    {
        Session[SessionObj] = null;
        Response.Redirect("GestaoCardapio.aspx?mode=1");
    }
}