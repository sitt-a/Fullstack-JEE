package rems_beans;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector 
{
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/new";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "Sitra";
    private Connection dbconnection;
    
    public DBConnector()
    
    {
    try
    {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	dbconnection=DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
   }

	public Connection getDbconnection() {
		return dbconnection;
	}
    
    
}
