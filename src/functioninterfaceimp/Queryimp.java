package functioninterfaceimp;
import Goods.Goods;
import JDBCutils.JDBCutilsgoods;
import functioninterface.Query;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Queryimp implements Query {
    public Goods query(String name)
    {
        new Situationimp().buffered("查询商品");
        Goods goods=null;
        String sql="SELECT*FROM GOODS.PRODUCT WHERE NAME=?";
        PreparedStatement pstat=JDBCutilsgoods.getPreparedStatement(sql);
        try
        {
            pstat.setString(1,name);
            ResultSet re=pstat.executeQuery();
            if(false==re.next())
            {
                pstat.close();
                re.close();
                return goods;
            }
            goods=new Goods();
            System.out.println(name);
            goods.setName(name);
            goods.setPrice(Integer.valueOf(re.getString("PRICE")));
            if(re.getInt("NUMBER")==0)
            {
                goods.setNumber(0);
            }
           else
            {
                goods.setNumber(re.getInt("number"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return goods;
    }
}
