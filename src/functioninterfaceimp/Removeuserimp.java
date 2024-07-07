package functioninterfaceimp;

import JDBCutils.JDBCutilsusers;
import User.User;
import functioninterface.Removeuser;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Removeuserimp implements Removeuser {
    public  User remove(String account)
    {
        new Situationimp().buffered("添加用户");
        User user=null;
        String sql="delete from user where account=?";
        PreparedStatement pstat= JDBCutilsusers.getPreparedStatement(sql);
        try
        {
            user=new User();
            user.setAccount(account);
            pstat.setString(1,account);
            pstat.executeUpdate();
            pstat.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return user;
    }
}
