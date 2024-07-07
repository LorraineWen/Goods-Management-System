package functioninterfaceimp;
import JDBCutils.JDBCutilsusers;
import functioninterface.Regist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Registimp implements Regist {
    public void regist(String name,String account,String password,String power)
    {
        String sql="INSERT INTO USER.user(name, account, password, power) VALUE (?,?,?,?)";
        PreparedStatement pstat= JDBCutilsusers.getPreparedStatement(sql);
            try
            {
                pstat.setString(1,name);
                pstat.setString(2,account);
                pstat.setString(3,password);
                pstat.setString(4,power);
                pstat.executeUpdate();
                pstat.close();
            }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
