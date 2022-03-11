package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import util.Context;

/**
 * Application Lifecycle Listener implementation class TomcatLaunch
 *
 */
public class TomcatLaunch implements ServletContextListener {
   public void contextInitialized(ServletContextEvent sce)  { 
      try {
		Class.forName("com.mysql.jdbc.Driver");
		Context.getSingleton();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
      
    }
   
    public void contextDestroyed(ServletContextEvent sce)  { 
     Context.getSingleton().close();
    }

 
	
}
