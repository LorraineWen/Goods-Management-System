package JDBCutils;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class JDBCutilsusers {
    private static String driverclass;
    private static String url;
    private static String username;
    private static String password;
    static
    {
        try
        {
            InputStream is= JDBCutilsusers.class.getClassLoader().getResourceAsStream("JDBCutils.propertise");
            Properties prop=new Properties();
            prop.load(is);
            driverclass=prop.getProperty("driverclass");
            url=prop.getProperty("urluser");
            username=prop.getProperty("username");
            password=prop.getProperty("password");
            Class.forName(driverclass);
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    public static Connection getconnection()
    {
        Connection con=null;
        try
        {
            con=DriverManager.getConnection(url,username,password);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return con;
    }
    public static PreparedStatement getPreparedStatement(String sql)
    {
        PreparedStatement pstat=null;
        try
        {
            Connection con=DriverManager.getConnection(url,username,password);
            pstat=con.prepareStatement(sql);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return pstat;
    }
    public static Statement getStatement(String sql)
    {
        Statement stat=null;
        try
        {
            Connection con=DriverManager.getConnection(url,username,password);
            stat=con.prepareStatement(sql);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return stat;
    }
    public static void close(Connection con, Statement stat, ResultSet re)
    {
        try
        {
            con.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            stat.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            re.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    public static void close(Connection con, Statement stat)
    {
        try
        {
            con.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        try
        {
            stat.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }

}
