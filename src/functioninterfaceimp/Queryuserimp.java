package functioninterfaceimp;

import JDBCutils.JDBCutilsusers;
import User.User;
import functioninterface.Queryuser;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
public class Queryuserimp implements Queryuser {
    public HashMap query(String name)
    {
        new Situationimp().buffered("查询用户");
        int cnt=0;
        HashMap<String,User> alluser=new HashMap<String,User>();
        String sql="select *from user where name=?";
        PreparedStatement pstat= JDBCutilsusers.getPreparedStatement(sql);
        try
        {
            pstat.setString(1,name);
            ResultSet re=pstat.executeQuery();
            while(re.next())
            {
                User user=new User(re.getString("name"),re.getString("account"),re.getString("password"),re.getString("power"));
                alluser.put(name+cnt,user);
                cnt++;
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return alluser;
    }
    public User queryone(String accout)
    {
        User user=null;
        String sql="select *from user where account=?";
        PreparedStatement pstat=JDBCutilsusers.getPreparedStatement(sql);
       try
       {
           pstat.setString(1,accout);
           ResultSet re=pstat.executeQuery();
           while (re.next())
           {
               user=new User();
               user.setName(re.getString("name"));
               user.setAccount(accout);
               user.setPower(re.getString("power"));
               user.setPassword(re.getString("password"));
           }
           re.close();
           pstat.close();
       }
       catch (SQLException e)
       {
           e.printStackTrace();
       }
       return  user;
    }
}
