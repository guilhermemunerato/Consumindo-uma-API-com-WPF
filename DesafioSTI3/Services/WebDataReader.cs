using DesafioSTI3.Data;
using DesafioSTI3.Models;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Net;

namespace DesafioSTI3.DAL
{
    public class WebDataReader
    {
        private readonly Contexto _context = new Contexto();
        private readonly string url = "https://desafiotecnicosti3.azurewebsites.net/pedido";

        public async System.Threading.Tasks.Task<List<PedidoViewModel>> GetPedidosApi()
        {
            // Acesso ao Json
            WebRequest oRequest = WebRequest.Create(url);
            WebResponse oResposnse = oRequest.GetResponse();
            StreamReader Xpto = new StreamReader(oResposnse.GetResponseStream());
            // Leitura dos Dados
            string Resposta = await Xpto.ReadToEndAsync();
            // Deserialização do Json no Objeto Pedido
            List<PedidoViewModel> lst = JsonConvert.DeserializeObject<List<PedidoViewModel>>(Resposta);
            CarregarDados(lst);
            return lst;
        }
        
        public async void CarregarDados(List<PedidoViewModel> dados)
        {
            foreach (var pedido in dados)
            {
                // Pesquisa e Grava o Cliente no Banco
                var cliente = _context.Clientes.Find(pedido.Cliente.Id);
                if (cliente == null)
                {
                    cliente = new Cliente()
                    {
                        Id = pedido.Cliente.Id,
                        Cnpj = pedido.Cliente.Cnpj,
                        Cpf = pedido.Cliente.Cpf,
                        Nome = pedido.Cliente.Nome,
                        RazaoSocial = pedido.Cliente.RazaoSocial,
                        Email = pedido.Cliente.Email,
                        DataNascimento = pedido.Cliente.DataNascimento
                    };
                    _context.Add(cliente);
                    await _context.SaveChangesAsync();
                }

                // Pesquisa e Grava o Endereço do Entrega
                var endereco = _context.EnderecoEntregas.Find(pedido.EnderecoEntrega.Id);
                if (endereco == null)
                {
                    endereco = new EnderecoEntrega()
                    {
                        Id = pedido.EnderecoEntrega.Id,
                        Endereco = pedido.EnderecoEntrega.Endereco,
                        Numero = pedido.EnderecoEntrega.Numero,
                        Cep = pedido.EnderecoEntrega.Cep,
                        Bairro = pedido.EnderecoEntrega.Bairro,
                        Cidade = pedido.EnderecoEntrega.Cidade,
                        Estado = pedido.EnderecoEntrega.Estado,
                        Complemento = pedido.EnderecoEntrega.Complemento,
                        Referencia = pedido.EnderecoEntrega.Referencia
                    };
                    _context.Add(endereco);
                    await _context.SaveChangesAsync();
                }

                // Pesquisa e Grava o Pedido
                var ped = _context.Pedidos.Find(pedido.Id);
                if (ped == null)
                {
                    ped = new Pedido()
                    {
                        Id = pedido.Id,
                        Numero = pedido.Numero,
                        DataCriacao = pedido.DataCriacao,
                        DataAlteracao = pedido.DataAlteracao,
                        Status = pedido.Status,
                        Desconto = pedido.Desconto,
                        Frete = pedido.Frete,
                        SubTotal = pedido.SubTotal,
                        ValorTotal = pedido.ValorTotal,
                        Cliente = cliente,
                        EnderecoEntrega = endereco
                    };
                    _context.Add(ped);
                    await _context.SaveChangesAsync();
                }
                ped.Itens = new List<Itens>();
                ped.Pagamento = new List<Pagamento>();

                foreach (var item in pedido.Itens)
                {
                    var produto = _context.Produtos.Find(item.IdProduto);
                    if (produto == null)
                    {
                        produto = new Produto()
                        {
                            Id = item.IdProduto,
                            Nome = item.Nome,
                            Quantidade = item.Quantidade,
                            ValorUnitario = item.Quantidade
                        };
                        _context.Add(produto);
                        await _context.SaveChangesAsync();
                    }
                    var itens = _context.Itens.Find(item.Id);
                    if (itens == null)
                    {
                        itens = new Itens()
                        {
                            Id = item.Id,
                            Produto = produto
                        };
                        ped.Itens.Add(itens);
                        itens.Pedido = ped;
                        _context.Add(itens);
                        await _context.SaveChangesAsync();
                    }
                }

                foreach (var pagto in pedido.Pagamento)
                {
                    var metodo = _context.MetodoPagamentos.Find(pagto.Codigo);
                    if (metodo == null)
                    {
                        metodo = new MetodoPagamento()
                        {
                            Codigo = pagto.Codigo,
                            Nome = pagto.Nome
                        };
                        _context.Add(metodo);
                        await _context.SaveChangesAsync();
                    }
                    var pagtos = _context.Pagamentos.Find(pagto.Id);
                    if (pagtos == null)
                    {
                        pagtos = new Pagamento()
                        {
                            Id = pagto.Id,
                            MetodoPagamento = metodo,
                            Parcela = pagto.Parcela,
                            Valor = pagto.Valor
                        };
                        ped.Pagamento.Add(pagtos);
                        pagtos.Pedido = ped;
                        _context.Add(pagtos);
                        await _context.SaveChangesAsync();
                    }
                }
            }


        }

    }
}
