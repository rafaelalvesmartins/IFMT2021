package edu.br.ifmt;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class NovoUsuarioPage {
	private WebDriver driver;
	
	public NovoUsuarioPage(WebDriver driver) {
			this.driver = driver;
	}
	
	public void cadastra(String nome, String email, String senha) {
		WebElement txtNome =
		driver.findElement(By.id("user_username"));
		
		WebElement txtEmail =
		driver.findElement(By.id("user_email"));
		
		WebElement txtSenha =
				driver.findElement(By.id("user_password"));
		
		txtNome.sendKeys(nome);
		txtEmail.sendKeys(email);
		txtSenha.sendKeys(senha);
		
		
		WebElement sign_up_button =
				driver.findElement(By.id("submit"));
		
		sign_up_button.click();
	}
	
	public boolean existeNaListagem(String nome) {
		// verifica se  existe na listagem
			return driver.getPageSource().contains(nome);
		}
}
