package functioninterfaceimp;

import JDBCutils.JDBCutilsusers;
import User.User;
import functioninterface.Changeuser;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Changeuserimp implements Changeuser {
    public User change(String name,String insteadaccount,String account,String password,String power)
    {
        new Situationimp().buffered("修改用户");
        User user=null;
        String realname=name;
        String realpower=power;
        String realpassword=password;
        String realaccount=insteadaccount;
        String sql="update user set name=?,account=?,password=?,power=? where account=?";
        PreparedStatement pstat= JDBCutilsusers.getPreparedStatement(sql);
        user=new Queryuserimp().queryone(account);
        if(name==null)
        {
             realname=user.getName();
        }
        if(power==null)
        {
            realpower=user.getPower();
        }
        if(password==null)
        {
           realpassword=user.getPassword();
        }
        if(insteadaccount==null)
        {
            realaccount=user.getAccount();
        }
        try
        {
            pstat.setString(1,realname);
            pstat.setString(2,realaccount);
            pstat.setString(3,realpassword);
            pstat.setString(4,realpower);
            pstat.setString(5,account);
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
