package edu.br.ifmt;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

public class Principal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		chamadaIFMTGoogle();
		

	}
	
	
	public static void chamadaIFMTGoogle() {
		// abre firefox
		WebDriver driver = new FirefoxDriver();
		
		// acessa o site do google
		driver.get("http://www.google.com.br/");
		
		// digita no campo com nome "q" do google
		
		WebElement campoDeTexto =
		driver.findElement(By.name("q"));
		campoDeTexto.sendKeys("IFMT");
		
		// submete o form
		campoDeTexto.submit();
	}
	
	

}
