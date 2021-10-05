package edu.br.ifmt;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class UsuariosPage {

	private WebDriver driver;
	
	public UsuariosPage(WebDriver driver) {
		this.driver = driver;
	}
	
	public void visita() {
		driver.get("https://selenium-blog.herokuapp.com");
	}
	
	public NovoUsuarioPage novo() {
		// clica no link de novo usuário
		driver.findElement(By.linkText("Sign up")).click();
		
		// retorna a classe que representa a nova pagina
		return new NovoUsuarioPage(driver);
	}
	
	

}
