package functioninterfaceimp;
import Goods.Goods;
import JDBCutils.JDBCutilsgoods;
import JDBCutils.JDBCutilsusers;
import functioninterface.Add;
import functioninterface.Query;
import functioninterface.Situation;
import org.xml.sax.SAXException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Addimp implements Add {
    public void add(String name,String price,String number)
    {

        Goods goods=new Goods();
        Query q=new Queryimp();
        goods=q.query(name);
       new Situationimp().buffered("添加商品");
        if(null!=goods)
        {
            String sql="update product set number=? where name=?";
            String sql1="select*from product where name=?";
            PreparedStatement pstat =JDBCutilsgoods.getPreparedStatement(sql);
            PreparedStatement pstat1=JDBCutilsgoods.getPreparedStatement(sql1);
           try
           {
               pstat1.setString(1,name);
               ResultSet re=pstat1.executeQuery();
             re.next();
               int num=re.getInt("number");
               pstat.setString(1,String.valueOf(num+Integer.valueOf(number)));
               pstat.setString(2,name);
               pstat.executeUpdate();
               pstat.close();
           }
           catch (SQLException e)
           {
               e.printStackTrace();
           }
        }
       else {
            String sql="insert into goods.product(name, price,number) VALUE (?,?,?)";
            PreparedStatement pstat= JDBCutilsgoods.getPreparedStatement(sql);
            try
            {
                pstat.setString(1,name);
                pstat.setString(2,price);
                pstat.setString(3,number);
                pstat.executeUpdate();
                pstat.close();
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
    }
}
