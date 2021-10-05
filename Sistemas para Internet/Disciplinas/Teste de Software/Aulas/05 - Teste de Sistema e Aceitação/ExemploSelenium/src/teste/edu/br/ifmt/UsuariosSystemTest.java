package teste.edu.br.ifmt;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

import edu.br.ifmt.NovoUsuarioPage;
import edu.br.ifmt.UsuariosPage;

class UsuariosSystemTest {
	
	private WebDriver driver;
	private UsuariosPage usuarios;
	private String dataHora;
	
	@Before
	public void inicializa() {
		this.driver = new FirefoxDriver();
		this.usuarios = new UsuariosPage(driver);
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		dataHora = new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss").format(timestamp.getTime());
		
	}
	

	@Test
	void deveAdicionarUmUsuario() {
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String dataHora = new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss").format(timestamp.getTime());
		
		driver = new FirefoxDriver();
		
		driver.get("https://selenium-blog.herokuapp.com/signup");
		
		
		WebElement nome =
		driver.findElement(By.id("user_username"));
		
		
		WebElement email =
		driver.findElement(By.id("user_email"));
		
		WebElement senha =
				driver.findElement(By.id("user_password"));
		
		
		nome.sendKeys("user"+dataHora);
		email.sendKeys("user"+dataHora+"@test.com");
		senha.sendKeys("password");
		
		WebElement sign_up_button =
				driver.findElement(By.id("submit"));
		
		sign_up_button.click();
		
		boolean achouNome = driver.getPageSource().contains("Welcome to the alpha blog user"+dataHora);
	
		
		assertTrue(achouNome);
		
	}
	
	
	@Ignore
	public void deveAdicionarUmUsuarioInicio() {
		
		this.driver = new FirefoxDriver();
		this.usuarios = new UsuariosPage(driver);
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		dataHora = new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss").format(timestamp.getTime());
		
		
		this.usuarios.visita();
		NovoUsuarioPage novoUsuario = this.usuarios.novo();
		
		novoUsuario.cadastra("user"+dataHora,	"user"+dataHora+"@test.com", "user_password");
		assertTrue(novoUsuario.existeNaListagem("Welcome to the alpha blog user"+dataHora));
		
		
	}
	
	@After
	public void encerra() {
		driver.close();
	}

}
