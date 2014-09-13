using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Serialization;
using System.Text;

/// <summary>
/// Métodos genéricos
/// </summary>
public class Library
{
    public static string Serializar(object objeto)
    {
        try
        {
            using (StringWriter writer = new StringWriter())
            {
                XmlSerializer serializer = new XmlSerializer(objeto.GetType());
                serializer.Serialize(writer, objeto);
                return writer.ToString();
            }
        }
        catch (Exception) { throw; }
    }

    public static object Deserializar(string xml, object modelo)
    {
        try
        {
            using (StringReader reader = new StringReader(xml))
            {
                XmlSerializer serializer = new XmlSerializer(modelo.GetType());
                return serializer.Deserialize(reader);
            }
        }
        catch (Exception) { throw; }
    }

    public static bool SalvarXml(string xml)
    {
        try
        {
            if (string.IsNullOrEmpty(xml)) throw new Exception("O XML deve ser informado com parâmetros");

            string path = HttpContext.Current.Server.MapPath("~/App_Data");
            if (!string.IsNullOrEmpty(path))
            {
                File.WriteAllBytes(Path.Combine(path, "itens.xml"), UTF8Encoding.UTF8.GetBytes(xml));
            }

            return true;
        }
        catch (Exception) { return false; }
    }

    public static string BuscarXml()
    {
        string xml = null;

        try
        {
            string path = HttpContext.Current.Server.MapPath("~/App_Data/itens.xml");
            if (!string.IsNullOrEmpty(path))
            {
                byte[] data = File.ReadAllBytes(path);
                if (data != null && data.Length > 0)
                {
                    xml = UTF8Encoding.UTF8.GetString(data);
                }
            }

            return xml;
        }
        catch (Exception) { return null; }
    }

    public static List<ItemCardapio> buscaLista()
    {
        try
        {
            List<ItemCardapio> lista = null;

            string xml = BuscarXml();
            if (!string.IsNullOrEmpty(xml))
            {
                lista = new List<ItemCardapio>();
                lista = (List<ItemCardapio>)Library.Deserializar(xml, lista);
            }

            return lista;
        }
        catch (Exception) { throw; }
    }
}