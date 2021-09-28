package test.edu.br.ifmt.service;

import static org.junit.Assert.*;

import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;


import main.edu.br.ifmt.model.entity.Aluno;
import main.edu.br.ifmt.model.entity.Frequencia;
import main.edu.br.ifmt.model.entity.Nota;
import main.edu.br.ifmt.model.service.AlunoService;;

public class AlunoServiceTest {

	Aluno alunoRenato;
	AlunoService alunoService;
	
	@Before
	public void iniciaCadaTeste() {
		
		alunoService = new AlunoService();
		
		// Aluno Renato
		alunoRenato = new Aluno();
		alunoRenato.setNome("Renato");
		
		// Frequência
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(2021, 9, 29);
		Frequencia frequenciaRenatoDia1 = new Frequencia();
		frequenciaRenatoDia1.setData(calendar);
		frequenciaRenatoDia1.setFalta(true);
		
		calendar.set(2021, 10, 04);
		Frequencia frequenciaRenatoDia2 = new Frequencia();
		frequenciaRenatoDia2.setData(calendar);
		frequenciaRenatoDia2.setFalta(false);
		
		Set<Frequencia> frenquenciasRenato = new HashSet<Frequencia>();
		frenquenciasRenato.add(frequenciaRenatoDia1);
		frenquenciasRenato.add(frequenciaRenatoDia2);
		
		alunoRenato.setFrequencias(frenquenciasRenato);
		
		// Nota
		Nota nota1Renato = new Nota();
		nota1Renato.setNota(10);
		Nota nota2Renato = new Nota();
		nota2Renato.setNota(5);
		
		Set<Nota> notasRenato = new HashSet<Nota>();
		notasRenato.add(nota1Renato);
		notasRenato.add(nota2Renato);
	}
	
	
	@Test
	public void principaisTestesService() {
		
		
		List<Aluno> todosAlunos = alunoService.retornaTodosAlunos();
		int quantidadeTodalAntes = todosAlunos.size();
		
		alunoService.salvar(alunoRenato);
		assertEquals(quantidadeTodalAntes+1, alunoService.retornaTodosAlunos().size());
		
		Aluno alunoRenatoBD = alunoService.retornaAlunoId(alunoRenato.getId());
		assertEquals(alunoRenato, alunoRenatoBD);
				
		alunoService.removerAluno(alunoRenato);
		assertEquals(quantidadeTodalAntes, alunoService.retornaTodosAlunos().size());
	}
	

}
