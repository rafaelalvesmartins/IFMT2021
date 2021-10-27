package teste.edu.br.ifmt;

import static org.junit.Assert.assertEquals;

import org.junit.jupiter.api.Test;

import edu.br.ifmt.Calculadora;

public class TesteCalculadora {
	
	@Test
	void testeUnitarioSoma() {
		
		Calculadora calculadora = new Calculadora();
		assertEquals(10, calculadora.soma(4,6),0.0001);
		
	;}
	
	
	@Test
	void testeUnitarioDivisao() {
		
		Calculadora calculadora = new Calculadora();
		assertEquals(10, calculadora.divisao(100,10),0.0001);
		assertEquals(10, calculadora.divisao(100,2),0.0001);
		
	;}

}
