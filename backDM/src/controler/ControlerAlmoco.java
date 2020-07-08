
package controler;

import bean.Almoco;
import dao.DaoAlmoco;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberta
 */
public class ControlerAlmoco {
    
    //Classe DaoAlmoco quero um filho seu chamado daoAlmoco, e que ele seja independente, faça suas ações sem depender de um primo Almoco(static)...
    public static DaoAlmoco daoAlmoco;

    public Almoco buscaAlmocoPorId (Almoco almoco) throws SQLException, ClassNotFoundException {
        //daoAlmoco: sou independente! Quero trabalhar, quando eu começo?
        //Agora! Vou inicializar voce!
        daoAlmoco = new DaoAlmoco();
        //daoAlmoco: Estou pronto, o que devo fazer?
        //Retorna pra mim uma busca baseado nos dados de almoco, aquele dentro do parentesis. 
        return daoAlmoco.busca(almoco);
    }

    public Almoco inserirAlmoco (Almoco almoco) throws SQLException, ClassNotFoundException {
        //daoAlmoco: sou independente! Quero trabalhar, quando eu começo?
        //Agora! Vou inicializar voce!
        daoAlmoco = new DaoAlmoco();
        //daoAlmoco: Estou pronto, o que devo fazer?
        //Quero uma inserção baseado nos dados de almoco, aquele dentro do parentesis.
        return daoAlmoco.inserir(almoco);
    }

    public Almoco alteraAlmoco (Almoco almoco) throws SQLException, ClassNotFoundException {
        //daoAlmoco: sou independente! Quero trabalhar, quando eu começo?
        //Agora! Vou inicializar voce!
        daoAlmoco = new DaoAlmoco();
        //Quero uma alteração!
        //daoAlmoco: Opa, metodo alteracao esta vindo!!! Mas o que voce quer alterar?
        //Quero alterar o almoco que esta vindo por ai dentro de um parentesis
        return daoAlmoco.altera(almoco);
    }

    public Almoco excluiAlmoco (Almoco almoco) throws SQLException, ClassNotFoundException {
        //daoAlmoco: sou independente! Quero trabalhar, quando eu começo?
        //Agora! Vou inicializar voce!
        daoAlmoco = new DaoAlmoco();
        //Quero uma exclusão!!
        //daoAlmoco: Opa, metodo exclusao esta vindo!!! Mas o que voce quer excluir?
        //Quero excluir o almoco que esta vindo por ai dentro de um parentesis
        return daoAlmoco.excluir(almoco);
    }

    public List<Almoco> listaAlmoco(Almoco almoco) throws SQLException, ClassNotFoundException {
        //Criação de lista tipo Almoco
        List<Almoco> listLogs = new ArrayList();
        //daoAlmoco: sou independente! Quero trabalhar, quando eu começo?
        //Agora! Vou inicializar voce!
        daoAlmoco = new DaoAlmoco();
        //Quero ver todos os almocos com a letra a
        //daoAlmoco: Opa, metodo lista esta vindo!!!Mas tem muitos objs...Preciso guarda-los em um array!
        //Não seja por isso, eu criei a listLogs!
        //daoAlmoco: legal! Agora posso guardar mais de obj encontrado na lista.
        listLogs = daoAlmoco.lista(almoco);
        return listLogs;
    }
    
    public List<Almoco> listarTodos() throws SQLException, ClassNotFoundException {
        List<Almoco>  alm;
        daoAlmoco = new DaoAlmoco();
        alm = daoAlmoco.listaTodos();
        return alm;
    }
    
}
