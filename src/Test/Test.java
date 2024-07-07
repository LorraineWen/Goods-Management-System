package Test;

import Goods.Goods;
import User.User;
import functioninterface.*;
import functioninterfaceimp.*;

import java.util.HashMap;

public class Test {
    public static void main(String[] args) {
    Export e=new Exportimp();
    e.export("苹果","10","申通快递");
    }
}
