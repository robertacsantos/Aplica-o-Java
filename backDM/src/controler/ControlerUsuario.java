
package controler;

import bean.Usuario;
import dao.DaoPedido;
import dao.DaoUsuario;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberta
 */
public class ControlerUsuario {
    
    public static DaoUsuario usuarioDao;
    
    public Usuario validaUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        usuarioDao = new DaoUsuario();
        usuario = usuarioDao.validaLogin(usuario);
        return usuario;
    }
    
    public Usuario inserirUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        usuarioDao = new DaoUsuario();
        usuario = usuarioDao.inserir(usuario);
        return usuario;
    }
    public Usuario buscarUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        usuarioDao = new DaoUsuario();
        usuario = usuarioDao.busca(usuario);
        return usuario;
    }
     public Usuario alterarUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        usuarioDao = new DaoUsuario();
        usuario = usuarioDao.altera(usuario);
        return usuario;
    }
    public Usuario excluirUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        usuarioDao = new DaoUsuario();
        usuario = usuarioDao.excluir(usuario);
        return usuario;
    }
    
    public List<Usuario> listaTodos() throws SQLException, ClassNotFoundException {
        List<Usuario> listLogs = new ArrayList();
        usuarioDao = new DaoUsuario();
        listLogs = usuarioDao.listaTodos();
        return listLogs;
    }
    public List<Usuario> listaUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
        List<Usuario> listLogs = new ArrayList();
        usuarioDao = new DaoUsuario();
        listLogs = usuarioDao.lista(usuario);
        return listLogs;
    }
    
}
