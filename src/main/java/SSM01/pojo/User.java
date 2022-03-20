package SSM01.pojo;

import javax.validation.constraints.Pattern;


public class User {



    public User(String id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }
    private String id;

    @Pattern(regexp = "^([\\u4e00-\\u9fa5]{2,4})|([A-Za-z0-9_]{4,16})|([a-zA-Z0-9_\\u4e00-\\u9fa5]{3,16})$=",message = "请正确填入数据")
    private String username;
    private String password;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
