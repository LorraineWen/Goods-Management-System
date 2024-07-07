package functioninterface;
import User.User;
public interface Situation {
    public abstract void situation(String fun, User user);
    public abstract void buffered(String fun);
}
