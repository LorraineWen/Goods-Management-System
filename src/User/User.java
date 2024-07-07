package User;

public class User {
    private String name;
    private String account;
    private String password;
   private String power;
   public User(){}
   public User(String name,String account,String password,String power)
   {
       this.name=name;
       this.account=account;
       this.password=password;
       this.power=power;
   }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }
}
