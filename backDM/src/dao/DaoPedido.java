
package dao;

import bean.Almoco;
import bean.Pedido;
import conexao.ConexaoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Roberta
 */
public class DaoPedido {
    
    private final Connection c;
    
    public DaoPedido() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    
    public List<Pedido> listaTodos() throws SQLException{

        List<Pedido> pedidos = new ArrayList<>();
        
        String sql = "select * from pedido";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Usuario
            Pedido pedido = new Pedido(
                rs.getInt(1),
                rs.getInt(2),
                rs.getInt(3),
                rs.getString(3)
            );
            // adiciona o usu à lista de usus
            pedidos.add(pedido);
        }
        
        rs.close();
        stmt.close();
        return pedidos;
        
    }
    
    public Pedido inserir(Pedido pedido) throws SQLException{
        String sql = "insert into pedido" + "(idAlmoco, idBebida, descricao)" + "values(?, ?, ?)";
        
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        
        stmt.setInt(1, pedido.getIdAlmoco());
        stmt.setInt(2, pedido.getIdBebida());
        stmt.setString(3, pedido.getDescricao());
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        
        if(rs.next()){
            int id = rs.getInt(1);
            pedido.setId(id);
        }
        stmt.close();
        return pedido;
    }
    public Pedido busca(Pedido pedido) throws SQLException{
        String sql = "select * from pedido WHERE id = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setInt(1, pedido.getId());
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            pedido.setId(rs.getInt("id"));
            pedido.setIdAlmoco(rs.getInt("idAlmoco"));
            pedido.setIdBebida(rs.getInt("idBebida"));
            pedido.setDescricao(rs.getString("descricao"));
        }
        stmt.close();
        c.close();
        return pedido;
    }
    
     public Pedido altera (Pedido pedido) throws SQLException{
        String sql = "UPDATE pedido SET idAlmoco = ?, idBebida = ?, descricao = ? WHERE id = ?";
        
        PreparedStatement stmt = c.prepareStatement(sql);
        
        stmt.setInt(1, pedido.getIdAlmoco());
        stmt.setInt(2, pedido.getIdBebida());
        stmt.setString(3, pedido.getDescricao());
        stmt.setInt(4, pedido.getId());
        stmt.execute();
        stmt.close();
        c.close();
        
        return pedido;
    }  
    
    public Pedido excluir (Pedido pedido) throws SQLException{
        String sql = "delete from pedido where id = ?";
        
        PreparedStatement stmt = c.prepareStatement(sql);
        stmt.setInt(1, pedido.getId());
        stmt.execute();
        stmt.close();
        c.close();
        return pedido;
    }
    
    public List<Pedido> lista (Pedido pedido) throws SQLException{
        
        List<Pedido> pedidos = new ArrayList<>();
        String sql = "select * from pedido where id like ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setString(1, "%" + pedido.getId() + "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Pedido pdido = new Pedido(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4));
            
            pedidos.add(pdido);
        }
        
        rs.close();
        stmt.close();
        return pedidos;
    }
    
    
    
    
    
}
