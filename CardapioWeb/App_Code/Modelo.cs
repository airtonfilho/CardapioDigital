using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Objeto que representa o item do cardápio
/// </summary>
public class ItemCardapio
{
    // Atributos da classe
    public string ID { get; set; }
    public string Nome { get; set; }
    public string Descricao { get; set; }
    public string NomeImagem { get; set; }
    public TipoItem Tipo { get; set; }

    // Método construtor
    public ItemCardapio() { }
}

public enum TipoItem
{
    Aperitivo = 0,
    Bebida = 1,
    PratoPrincipal = 2,
    Sobremesa = 3
}