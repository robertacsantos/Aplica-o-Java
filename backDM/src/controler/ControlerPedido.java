
package controler;

import bean.Almoco;
import bean.Pedido;
import dao.DaoAlmoco;
import dao.DaoPedido;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberta
 */
public class ControlerPedido {
    
    public static DaoPedido daoPedido;

    public Pedido buscaPedidoPorId (Pedido pedido) throws SQLException, ClassNotFoundException {
        daoPedido = new DaoPedido();
        return daoPedido.busca(pedido);
    }

    public Pedido inserirPedido (Pedido pedido) throws SQLException, ClassNotFoundException {
        daoPedido = new DaoPedido();
        return daoPedido.inserir(pedido);
    }

    public Pedido alteraPedido (Pedido pedido) throws SQLException, ClassNotFoundException {
        daoPedido = new DaoPedido();
        return daoPedido.altera(pedido);
    }

    public Pedido excluiPedido (Pedido pedido) throws SQLException, ClassNotFoundException {
        daoPedido = new DaoPedido();
        return daoPedido.excluir(pedido);
    }

    public List<Pedido> listaPedido (Pedido pedido) throws SQLException, ClassNotFoundException {
        List<Pedido> listLogs = new ArrayList();
        daoPedido = new DaoPedido();
        listLogs = daoPedido.lista(pedido);
        return listLogs;
    }
    public List<Pedido> listaTodos () throws SQLException, ClassNotFoundException {
        List<Pedido> listLogs = new ArrayList();
        daoPedido = new DaoPedido();
        listLogs = daoPedido.listaTodos();
        return listLogs;
    }
    
    
}
