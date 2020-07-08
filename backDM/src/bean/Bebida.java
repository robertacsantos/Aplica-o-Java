
package bean;

/**
 *
 * @author Roberta
 */
public class Bebida {
    
    private int id;
    private String tipoBebida;
    private String descricao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipoBebida() {
        return tipoBebida;
    }

    public void setTipoBebida(String tipoBebida) {
        this.tipoBebida = tipoBebida;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Bebida(int id, String tipoBebida, String descricao) {
        this.id = id;
        this.tipoBebida = tipoBebida;
        this.descricao = descricao;
    }
        
}
