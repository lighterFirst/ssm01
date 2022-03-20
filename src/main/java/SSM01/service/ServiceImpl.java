package SSM01.service;

import SSM01.dao.Dao;
import SSM01.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ServiceImpl implements Service01 {

    @Autowired
    private Dao dao;

    public List<User> select01() {
        return dao.select02();
    }

    public int insert(User user) {
        return dao.insert01(user);
    }

    public int check01(String username) {
        int k = dao.check01(username);
        return k;
    }

    @Transactional(rollbackFor = Exception.class)
    public int update01(User user) {
        return dao.update01(user);
    }
}
