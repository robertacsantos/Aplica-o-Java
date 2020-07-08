
package dao;

import bean.Bebida;
import bean.Usuario;
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
public class DaoUsuario {
    private final Connection c;
    
    public DaoUsuario() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    
    public List<Usuario> listaTodos() throws SQLException{

     
        List<Usuario> usuarios = new ArrayList<>();
        
        String sql = "select * from usuario";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            
            Usuario usuario = new Usuario(
                rs.getInt(1),
                    
                rs.getString(2),
                    
                rs.getString(3),
                
                rs.getString(4)
            );
            
            usuarios.add(usuario);
        }
        
        rs.close();
        stmt.close();
        return usuarios;
        
    }
    
    public Usuario inserir(Usuario usuario) throws SQLException{
      String sql = "insert into usuario" + " (nome, senha, statusOpe)" + " values (?,?,?)";

      // prepared statement para inserção
      PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

      // seta os valores
      stmt.setString(1,usuario.getNome());
      stmt.setString(2,usuario.getSenha());
      stmt.setString(3,usuario.getStatus());

      // executa
      stmt.executeUpdate();
      ResultSet rs = stmt.getGeneratedKeys();
      if (rs.next()) {
          int id = rs.getInt(1);
          usuario.setId(id);
      }
      stmt.close();
      return usuario;
    }
      
    public Usuario busca(Usuario usuario) throws SQLException{
        String sql = "select * from usuario WHERE id = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
            // seta os valores
            stmt.setInt(1,usuario.getId());
            // executa
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Usuario
                usuario.setId(rs.getInt(1));
                usuario.setNome(rs.getString(2));
                usuario.setSenha(rs.getString(3));
                usuario.setStatus(rs.getString(4));
            }
            
            stmt.close();
            rs.close();
        return usuario;
    }
    
    public Usuario validaLogin(Usuario usuario) throws SQLException{
     
        String sql = "select * from usuario WHERE nome = ? AND senha = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setString(1,usuario.getNome());
        stmt.setString(2,usuario.getSenha());
        
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            
            usuario.setId(rs.getInt(1));
            usuario.setNome(rs.getString(2));
            usuario.setSenha(rs.getString(3));
            usuario.setStatus(rs.getString(4));
            
        }
        stmt.close();
        return usuario;
    }
    
    public Usuario altera (Usuario usuario) throws SQLException{
       
        String sql = "UPDATE usuario SET nome = ?, senha = ?, status = ? WHERE id = ?";
        
        PreparedStatement stmt = c.prepareStatement(sql);
        
        stmt.setString(1, usuario.getNome());
        stmt.setString(2, usuario.getSenha());
        stmt.setString(3, usuario.getStatus());
        stmt.setInt(4, usuario.getId());

        stmt.execute();

        stmt.close();
        c.close();
        
        return usuario;
    }    
    
    public Usuario excluir (Usuario usuario) throws SQLException{
        //querie que vai pro banco atraves do metodo stmt
        String sql = "delete from usuario where id = ?";
        
        //define metodo stmt
        PreparedStatement stmt = c.prepareStatement(sql);
        //conexao set na querie um dado tipo inteiro. stmt: qual dado? eu: almoocooo pega seu id, que eu vou colocar o ponto de interrogação.
        stmt.setInt(1, usuario.getId());
        //executa
        stmt.execute();
        //fecha conexao
        stmt.close();
        c.close();
        return usuario;
    }
    
    public List<Usuario> lista (Usuario usuario) throws SQLException{
        
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "select * from usuario where id like ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        
        stmt.setString(1, "%" + usuario.getId() + "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while(rs.next()){
            Usuario usu = new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
            
            usuarios.add(usu);
        }
        
        rs.close();
        stmt.close();
        return usuarios;
    }
    
    
    
}
