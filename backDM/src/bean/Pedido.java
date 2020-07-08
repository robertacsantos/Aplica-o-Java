
package bean;

/**
 *
 * @author Roberta
 */
public class Pedido {
    private int id;
    private int idAlmoco;
    private int idBebida;
    private String descricao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdAlmoco() {
        return idAlmoco;
    }

    public void setIdAlmoco(int idAlmoco) {
        this.idAlmoco = idAlmoco;
    }

    public int getIdBebida() {
        return idBebida;
    }

    public void setIdBebida(int idBebida) {
        this.idBebida = idBebida;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Pedido(int id, int idAlmoco, int idBebida, String descricao) {
        this.id = id;
        this.idAlmoco = idAlmoco;
        this.idBebida = idBebida;
        this.descricao = descricao;
    }
    
    
    
}
