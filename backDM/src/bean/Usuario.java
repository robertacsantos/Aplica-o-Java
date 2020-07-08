
package bean;

import java.io.Serializable;



/**
 *
 * @author Roberta
 */
public class Usuario implements Serializable{
    private int id;
    private String nome;
    private String senha;
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public Usuario(int id, String nome, String senha, String status) {
        this.id = id;
        this.nome = nome;
        this.senha = senha;
        this.status = status;
    }
    
    
    
}
