package functioninterfaceimp;
import JDBCutils.JDBCutilssituation;
import JDBCutils.JDBCutilsusers;
import User.User;
import functioninterface.Query;
import functioninterface.Situation;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Situationimp implements Situation {

    public void situation(String fun, User user)
    {
      Date date=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String strTime = sdf.format(date.getTime());
        System.out.println(strTime);
        String sql="insert into situation.situation(name,account,fun,time) value(?,?,?,?)";
        PreparedStatement pstat= JDBCutilssituation.getPreparedStatement(sql);
        try {
            pstat.setString(1,user.getName());
            pstat.setString(2,user.getAccount());
            pstat.setString(3,fun);
            pstat.setString(4,strTime);
            pstat.executeUpdate();
            pstat.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
    public  void buffered(String fun)
    {
        String sql1="select *from situation.buffered";
        try
        {
            Statement stat=JDBCutilsusers.getStatement(sql1);
            ResultSet re=stat.executeQuery(sql1);
            re.next();
            String account=re.getString("account");
          User user=new Queryuserimp().queryone(account);
          situation(fun,user);
        }
      catch (SQLException e)
      {
          e.printStackTrace();
      }
    }
}
