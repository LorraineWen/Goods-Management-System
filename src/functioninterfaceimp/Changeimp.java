package functioninterfaceimp;
import Goods.Goods;
import JDBCutils.JDBCutilsgoods;
import functioninterface.Change;
import functioninterface.Query;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class Changeimp implements Change {
    public  void change(String name,String insteadname,String price,String number)
    {
        new Situationimp().buffered("更改商品");
        String  realname=insteadname;
        int realnumber=Integer.valueOf(number);
        String realprice=price;
        Query q=new Queryimp();
        Goods goods=q.query(name);
        String sql="update product set name=?, price=? ,number=? where name=?";
        PreparedStatement pstat=JDBCutilsgoods.getPreparedStatement(sql);
        if(number==null)
        {
            realnumber=goods.getNumber();
        }
        if(insteadname==null)
        {
            realname=goods.getName();
        }
        if(price==null)
        {
            realprice=String.valueOf(goods.getPrice());
        }
        try {
            pstat.setString(1,realname);
            pstat.setString(2,realprice);
            pstat.setInt(3,realnumber);
            pstat.setString(4,name);
            pstat.executeUpdate();
            pstat.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
