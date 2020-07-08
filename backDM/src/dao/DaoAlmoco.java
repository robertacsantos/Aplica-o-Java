
package dao;
import bean.Almoco;
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
public class DaoAlmoco {
    
    private final Connection c;
    
    
    public DaoAlmoco() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    

    public List<Almoco> listaTodos() throws SQLException{

     
        List<Almoco> almocos = new ArrayList<>();
        
        String sql = "select * from almoco";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            
            Almoco almoco = new Almoco(
                rs.getInt(1),
                    
                rs.getString(2),
                    
                rs.getString(3)
            );
            
            almocos.add(almoco);
        }
        
        rs.close();
        stmt.close();
        return almocos;
        
    }
    
    public Almoco inserir(Almoco almoco) throws SQLException{
        
        String sql = "insert into almoco" + "(tipoAlmoco, descricao)" + "values(?, ?)";
        
      
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
         
        stmt.setString(1, almoco.getTipoAlmoco());
        
        stmt.setString(2, almoco.getDescricao());
        
        stmt.executeUpdate();
        
        ResultSet rs = stmt.getGeneratedKeys();
        
       
        if(rs.next()){
            int id = rs.getInt(1);
            almoco.setId(id);
        }
        stmt.close();
        return almoco;
    }
    
    public Almoco busca(Almoco almoco) throws SQLException{
       
        String sql = "select * from almoco WHERE id = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setInt(1, almoco.getId());
       
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            
            almoco.setId(rs.getInt("id"));
            almoco.setTipoAlmoco(rs.getString("tipoAlmoco"));
            almoco.setDescricao(rs.getString("descricao"));
        }
        
        stmt.close();
        c.close();
        return almoco;
    }
    
    public Almoco altera (Almoco almoco) throws SQLException{
      
        String sql = "UPDATE almoco SET tipoAlmoco = ?, descricao = ? WHERE id = ?";
        
        PreparedStatement stmt = c.prepareStatement(sql);
        
        stmt.setString(1, almoco.getTipoAlmoco());
       
        stmt.setString(2, almoco.getDescricao());
        
        stmt.setInt(3, almoco.getId());
        
        stmt.execute();
       
        stmt.close();
        c.close();
        
        return almoco;
    }    
    
    public Almoco excluir (Almoco almoco) throws SQLException{
        String sql = "delete from almoco where id = ?";
        
        
        PreparedStatement stmt = c.prepareStatement(sql);
        stmt.setInt(1, almoco.getId());
        stmt.execute();
        stmt.close();
        c.close();
        return almoco;
    }
    
    public List<Almoco> lista (Almoco almoco) throws SQLException{
        
        List<Almoco> almocos = new ArrayList<>();
        String sql = "select * from almoco where id like ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setString(1, "%" + almoco.getId() + "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            
            Almoco alm = new Almoco(rs.getInt(1), rs.getString(2), rs.getString(3));
            almocos.add(alm);
        }
        
        rs.close();
        stmt.close();
        return almocos;
    }
    
}
