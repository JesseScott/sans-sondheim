
//-------------------------------------
// AUTHENTICATE
//-------------------------------------

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.util.Properties;

public class Auth extends Authenticator {
  
  public Auth() {
    super();
  }

  public PasswordAuthentication getPasswordAuthentication() {
    String username = ""; 
    String password = "";

    try {
      P5Properties properties = new P5Properties();
      properties.load(openStream("settings/settings.properties"));

      username = properties.getStringProperty("env.view.username", "null");
      password = properties.getStringProperty("env.view.password", "null");
      //println("Username is " + username);
      //println("Password is " + password);
    }
    catch(IOException e) {
      println("Couldn't read settings file...");
    }
    
    println(" -- Authenticating -- ");
    return new PasswordAuthentication(username, password);
  }
}
