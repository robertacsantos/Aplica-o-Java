
package dao;
import bean.Almoco;
import bean.Bebida;
import conexao.ConexaoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberta
 */
public class DaoBebida {
    
    private final Connection c;
    
    public DaoBebida() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    
    public List<Bebida> listaTodos() throws SQLException{
         // usus: array armazena a lista de registros

        List<Bebida> bebidas = new ArrayList<>();
        
        String sql = "select * from bebida";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Usuario
            Bebida bebida = new Bebida(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3)
            );
            // adiciona o usu à lista de usus
            bebidas.add(bebida);
        }
        
        rs.close();
        stmt.close();
        return bebidas;
        
    }
    
    public Bebida inserir(Bebida bebida) throws SQLException{
        String sql = "insert into bebida" + "(tipoBebida, descricao)" + "values(?, ?)";
        
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        
        stmt.setString(1, bebida.getTipoBebida());
        stmt.setString(2, bebida.getDescricao());
        
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        
        if(rs.next()){
            int id = rs.getInt(1);
            bebida.setId(id);
        }
        stmt.close();
        return bebida;
    }
    
    public Bebida busca(Bebida bebida) throws SQLException{
        String sql = "select * from bebida WHERE id = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setInt(1, bebida.getId());
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            bebida.setId(rs.getInt("id"));
            bebida.setTipoBebida(rs.getString("tipoBebida"));
            bebida.setDescricao(rs.getString("descricao"));
        }
        
        stmt.close();
        c.close();
        return bebida;
    }
    
    public Bebida altera (Bebida bebida) throws SQLException{
        String sql = "UPDATE bebida SET tipoBebida = ?, descricao = ? WHERE id = ?";
        
        PreparedStatement stmt = c.prepareStatement(sql);
        
        stmt.setString(1, bebida.getTipoBebida());
        stmt.setString(2, bebida.getDescricao());
        stmt.setInt(3, bebida.getId());
        stmt.execute();
        stmt.close();
        c.close();
        
        return bebida;
    }    
    
    public Bebida excluir (Bebida bebida) throws SQLException{
        String sql = "delete from bebida where id = ?";
        
        PreparedStatement stmt = c.prepareStatement(sql);
        stmt.setInt(1, bebida.getId());
        stmt.execute();
        stmt.close();
        c.close();
        return bebida;
    }
    
    public List<Bebida> lista (Bebida bebida) throws SQLException{
        
        List<Bebida> bebidas = new ArrayList<>();
        String sql = "select * from bebida where id like ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setString(1, "%" + bebida.getId() + "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Bebida bbida = new Bebida(rs.getInt(1), rs.getString(2), rs.getString(3));
            
            bebidas.add(bbida);
        }
        
        rs.close();
        stmt.close();
        return bebidas;
    }
}
