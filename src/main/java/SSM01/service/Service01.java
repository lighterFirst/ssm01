package SSM01.service;

import SSM01.pojo.User;

import java.util.List;

public interface Service01 {
    List<User> select01();

    int insert(User user);

    int check01(String username);

    int update01(User user);
}
