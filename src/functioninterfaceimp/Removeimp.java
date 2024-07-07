package functioninterfaceimp;
import JDBCutils.JDBCutilsgoods;
import functioninterface.Query;
import functioninterface.Remove;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Removeimp implements Remove {
    public void remove(String name) {
        new Situationimp().buffered("删除商品");
        String sql="DELETE FROM GOODS.PRODUCT WHERE NAME=?";
        Query q=new Queryimp();
        if(q.query(name)==null)
        {
            return;
        }
        PreparedStatement pstat= JDBCutilsgoods.getPreparedStatement(sql);
        try
        {
            pstat.setString(1,name);
            pstat.executeUpdate();
            pstat.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
