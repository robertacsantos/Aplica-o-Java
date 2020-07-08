
package controler;

import bean.Bebida;
import dao.DaoBebida;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberta
 */
public class ControlerBebida {
    
    public static DaoBebida daoBebida;
    
    public List<Bebida> listarTodos() throws SQLException, ClassNotFoundException {
        List<Bebida> beb;
        daoBebida = new DaoBebida();
        beb = daoBebida.listaTodos();
        return beb;
    }

    public Bebida buscaBebidaPorId (Bebida bebida) throws SQLException, ClassNotFoundException {
        daoBebida = new DaoBebida();
        return daoBebida.busca(bebida);
    }

    public Bebida inserirBebida (Bebida bebida) throws SQLException, ClassNotFoundException {
        daoBebida = new DaoBebida();
        return daoBebida.inserir(bebida);
    }

    public Bebida alteraBebida (Bebida bebida) throws SQLException, ClassNotFoundException {
        daoBebida = new DaoBebida();
        return daoBebida.altera(bebida);
    }

    public Bebida excluiBebida (Bebida bebida) throws SQLException, ClassNotFoundException {
        daoBebida = new DaoBebida();
        return daoBebida.excluir(bebida);
    }

    public List<Bebida> listaBebida (Bebida bebida) throws SQLException, ClassNotFoundException {
        List<Bebida> listLogs = new ArrayList();
        daoBebida = new DaoBebida();
        listLogs = daoBebida.lista(bebida);
        return listLogs;
    }
    
    
}
