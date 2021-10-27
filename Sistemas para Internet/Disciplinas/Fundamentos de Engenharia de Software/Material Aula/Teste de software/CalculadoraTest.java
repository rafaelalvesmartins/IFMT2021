import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class CalculadoraTest {

	static Calculadora calculadora;
	@BeforeClass
	public static void  antesDeTodasChamadas() {
		calculadora = new Calculadora();
		System.out.println("Antes de todas chamadas");
		
	}
	
	@AfterClass
	public static void  depoisDeTodasChamadas() {
		System.out.println("Depois de todas chamadas");
		
	}
	
	@After
	public void depoisDeCadaChamada() {
		System.out.println("Depois de cada chamada");	
	}
	
	@Before
	public void antesDeCadaChamada() {
		System.out.println("Antes da chamanda");		
	}
	
	@Test
	public void testSoma() {
		
		double delta = .01;
		assertEquals(2.0, calculadora.soma(1, 1),delta);
	}

	@Test
	public void testSubtracao() {
		Calculadora calculadora = new Calculadora();
		double delta = .01;
		assertEquals(0.0, calculadora.subtracao(1, 1),delta);
	}

	@Test
	public void testMultiplicacao() {
		Calculadora calculadora = new Calculadora();
		double delta = .01;
		assertEquals(1.0, calculadora.multiplicacao(1, 1),delta);
	}

	@Test
	public void testDivicao() {
		Calculadora calculadora = new Calculadora();
		double delta = .01;
		assertEquals(1.0, calculadora.divicao(1, 1),delta);
	}

}
