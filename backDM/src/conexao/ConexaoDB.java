
package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Roberta
 */
public class ConexaoDB {
    
    public Connection getConnection() throws SQLException, ClassNotFoundException{
    
        try{
        
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/projetofinal";
            String usuario = "root";
            String senha = "1124";
            return DriverManager.getConnection(url, usuario, senha);
        }catch(SQLException e){
            throw new RuntimeException ("Erro: Conexao BD" + e);
        
        }catch(ClassNotFoundException e){
            throw new RuntimeException ("Erro: Conexao Classe" + e);
        }
    }
    
}
