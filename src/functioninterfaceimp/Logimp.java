package functioninterfaceimp;
import JDBCutils.JDBCutilsusers;
import User.User;
import functioninterface.Log;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Logimp implements Log {
    public int log(String account,String password) {
        String sbuf="update situation.buffered set account=?";
        String sql = "select*from User.user where account=? and password=?";
        PreparedStatement pstat = JDBCutilsusers.getPreparedStatement(sql);
        PreparedStatement pbuf=JDBCutilsusers.getPreparedStatement(sbuf);
        try {
            pbuf.setString(1,account);
            pstat.setString(1, account);
            pstat.setString(2, password);
            ResultSet re = pstat.executeQuery();
            //之前定义过了sql这里的参数不要sql了不然会报java.sql.SQLSyntaxErrorException
            if (false!=re.next()) {
                if (re.getString("power").equals("Manager")) {
                    pbuf.executeUpdate();
                    new Situationimp().buffered("成功登录");
                    re.close();
                    pbuf.close();
                    pstat.close();
                    return 1;
                }
            }
            re.close();
            pbuf.close();
            pstat.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
