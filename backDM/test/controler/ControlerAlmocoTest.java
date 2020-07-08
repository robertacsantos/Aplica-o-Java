/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import bean.Almoco;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Roberta
 */
public class ControlerAlmocoTest {
    
    public ControlerAlmocoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of buscaAlmocoPorId method, of class ControlerAlmoco.
     */
    @Test
    public void testInserirAlmoco() throws Exception {
          Almoco almoco = new Almoco(29, "Bife", "Arroz, Feijão");
          ControlerAlmoco contAlmoco = new ControlerAlmoco();
          almoco = contAlmoco.inserirAlmoco(almoco);
          assertEquals(29, almoco.getId());
    }
    
}
