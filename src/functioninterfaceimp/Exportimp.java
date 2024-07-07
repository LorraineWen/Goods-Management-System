package functioninterfaceimp;
import Goods.Goods;
import JDBCutils.JDBCutilsgoods;
import functioninterface.Change;
import functioninterface.Export;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
public class Exportimp implements Export {
    public Goods export(String name,String number,String method)
    { new Situationimp().buffered("商品出货");
        int num=0;
        Change c=new Changeimp();
        Goods goods=null;
        String sql="select*from goods.product where name=?";
        String sql1="insert into goods.export (name,price,number,method,time) value(?,?,?,?,?)";
        PreparedStatement pstat= JDBCutilsgoods.getPreparedStatement(sql);
        PreparedStatement pstat1=JDBCutilsgoods.getPreparedStatement(sql1);
        try
        {
            pstat.setString(1,name);
            ResultSet re=pstat.executeQuery();
            while (re.next()!=false)
            {
                num=Integer.valueOf(re.getString("number"));
                if(num==0)
                {
                    re.close();
                    pstat.close();
                    pstat1.close();
                    return goods;
                }
                num-=Integer.valueOf(number);
               if(num<=0)
               {
                   re.close();
                   pstat.close();
                   pstat1.close();
                   return goods;
               }
                c.change(name,name,re.getString("price"),String.valueOf(num));
            }
            goods=new Queryimp().query(name);
            pstat1.setString(1,name);
            pstat1.setString(2,String.valueOf(goods.getPrice()));
            pstat1.setString(3,number);
            pstat1.setString(4,method);
            Date date=new Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String time=sdf.format(date.getTime());
            pstat1.setString(5,time);
            pstat1.executeUpdate();
            re.close();
            pstat.close();
            pstat1.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return goods;
    }
}
