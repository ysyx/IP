package Database;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class DB{
    
    private String url;
    private Connection conn;
    private ResultSet rs;
    private Statement statement;
    
     public DB(){
        url="jdbc:mysql://localhost:3306/reserve?zeroDateTimeBehavior=convertToNull";
    }

   public boolean connect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url,"root","");
			
            conn.setAutoCommit(false);
            System.out.println("okey");
            return true;
	}
        
        catch(SQLException sqlEx){
            System.out.println("xxxxxxx!E@@"+sqlEx.getMessage());
            return false;
	}
        
        catch(ClassNotFoundException classEx){
            System.out.println("!@$E@#D@"+classEx.getMessage());
            return false;
	}
   }

   public String query(String sql){
        try{
            if(sql.substring(0, 6).toLowerCase().equals("select")){
		statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs = statement.executeQuery(sql);
                System.out.println("sql done");                 
            }
            else{
		statement = conn.createStatement();
                System.out.println("sql:"+sql);
                statement.executeUpdate(sql);
                conn.commit();
                System.out.println("Done");
                
            }
            return sql;
	}catch(SQLException sqlEx){
            System.out.println("error:"+sqlEx.getMessage());

            return sqlEx.getMessage();
	}
    }

	public void rollback(){
   	try{
   		conn.rollback();
   	}
   	catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());
		}
   }

   public int getNumberOfRows(){
		try{
			rs.last();

			return rs.getRow();
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());

			return 0;
		}
	}
	public String getDataAt(int row, String columnName){
		try{
			rs.absolute(row+1);

			return rs.getString(columnName);
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());

			return null;
		}
	}
	public void close(){
		try{
			statement.close();
			conn.commit();
			conn.close();
		}
		catch(SQLException sqlEx){
			System.out.println(sqlEx.getMessage());
		}
	}
}
