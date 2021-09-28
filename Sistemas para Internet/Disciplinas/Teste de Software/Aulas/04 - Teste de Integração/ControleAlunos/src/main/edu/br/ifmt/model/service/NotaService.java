package main.edu.br.ifmt.model.service;

import java.util.List;


import main.edu.br.ifmt.model.dao.NotaDAO;
import main.edu.br.ifmt.model.entity.*;

public class NotaService {
	private NotaDAO dao;
	
	public NotaService() {
		this.dao = NotaDAO.getInstance();
	}
		
	public Nota retornaNotaId(int id) {
		return dao.getById(id);
	}
	
	public void salvar(Nota frequencia) {
		dao.persist(frequencia);
	}
	
	public double retornaMediaNotas() {
		List<Nota>  todasNotas =  dao.findAll();
		
		if (todasNotas.size() >0) {
			int soma = 0;
			for(Nota nota : todasNotas) {
					soma += nota.getNota();
			}
			double media = soma / todasNotas.size();
			return media;
		}
		return 0;
	}
}
