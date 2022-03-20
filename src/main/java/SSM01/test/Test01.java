package SSM01.test;
import SSM01.pojo.User;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applactionContext.xml","classpath:springmvc.xml"})
public class Test01 {
    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;

    @Before
    public void initMokcMvc(){
       mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testpage(){
        try {
         MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/user/select").param("pn","1")).andReturn();
         MockHttpServletRequest request = result.getRequest();
            PageInfo attribute = (PageInfo) request.getAttribute("ss");
        System.out.println("当前页码"+attribute.getPageNum());
        System.out.println("总页码"+attribute.getPages());
        System.out.println("总记录数"+attribute.getTotal());
        List<User> list = attribute.getList();
        for(User user: list){
            System.out.println(user.getId());
        }

        } catch (Exception e) {
            e.printStackTrace();
        }



    }

}












