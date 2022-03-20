package SSM01.dao;

import SSM01.pojo.User;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface Dao {
    List<User> select02();


    int insert01(User user);

    int check01(String username);

    int update01(User user);
}
