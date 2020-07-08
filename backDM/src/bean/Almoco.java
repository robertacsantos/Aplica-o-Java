
package bean;

/**
 *
 * @author Roberta
 */
public class Almoco {
    private int id;
    private String tipoAlmoco;
    private String descricao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipoAlmoco() {
        return tipoAlmoco;
    }

    public void setTipoAlmoco(String tipoAlmoco) {
        this.tipoAlmoco = tipoAlmoco;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Almoco(int id, String tipoAlmoco, String descricao) {
        this.id = id;
        this.tipoAlmoco = tipoAlmoco;
        this.descricao = descricao;
    }
    
    
    
    
}
