﻿using Yagohf.PUC.Integracoes.Model;

namespace Yagohf.PUC.Integracoes.Data.Interface
{
    public interface IPedidoRepository
    {
        Pedido RecuperarPorChaveFornecedor(string fornecedor, string chavePedido);
        void AtualizarStatus(int idPedido, int novoStatus);
        int RegistrarEvento(int idPedido, int status, string informacoesAdicionais);
        string ObterMensagemStatus(int status);
    }
}
