package eduBeans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConnect {
	public static Connection dbcon() {
		Connection con = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection
	                           ("jdbc:mysql://localhost:3306/acorn2?useUnicode=true&characterEncoding=utf8","root","apmsetup");
		    stmt = con.createStatement();
		} catch (Exception e) { }
		
		return con;
	}
}
