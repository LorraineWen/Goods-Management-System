package functioninterface;

import User.User;

import java.util.HashMap;

public interface Queryuser {
    public abstract HashMap query(String name);
    public abstract User queryone(String account);
}
