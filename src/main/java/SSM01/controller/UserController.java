package SSM01.controller;

import SSM01.pojo.User;
import SSM01.service.Service01;
import SSM01.util.UuidGeneter;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.fasterxml.classmate.TypeResolver;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Autowired
    private Service01 service01;

    //分页查询
    @RequestMapping(value = "/user/select",method = RequestMethod.GET)
   public ModelAndView select01(@RequestParam(value="pn",defaultValue = "1")int pn ){
    ModelAndView mv = new ModelAndView();

    //在查询之前调用，传入页码，以及每页的大小
    PageHelper.startPage(pn,4);
    List<User> list=service01.select01();
    PageInfo pageInfo = new PageInfo(list);
    //封装了详细的打印信息，包括我们查出的数据，传入的连续显示页数
    mv.addObject("ss",pageInfo);
    mv.setViewName("love");
    return mv;
   }

   //ajax的分页查询
   @RequestMapping(value = "/user/select01/{pageNo}",method=RequestMethod.GET)
       @ResponseBody
       public Object select02(@PathVariable Integer pageNo){
        PageHelper.startPage(pageNo,4);
       List<User> list=service01.select01();
       PageInfo pageInfo = new PageInfo(list);
       return pageInfo;
   }

    //检查用户名是否重名
    @RequestMapping(value = "/user/check",method = RequestMethod.GET)
    @ResponseBody
    public Object check01(String username){
        Map<String,Object> map = new HashMap<String, Object>();
        //后端校验username字段是否合法
        String ss = "^([\\u4e00-\\u9fa5]{2,4})|([A-Za-z0-9_]{4,16})|([a-zA-Z0-9_\\u4e00-\\u9fa5]{3,16})$";
        if(!username.matches(ss)){
            map.put("a","用户名应在2-4之间");
            return map;
        }
      int a;
     if(0 == service01.check01(username)){
         a=200;
     }else {
         a=100;
     }

     map.put("a",a);

    return map;

    }

    //保存功能+ //后端校验：jr303
    @RequestMapping(value = "/user/select01",method=RequestMethod.POST)
    @ResponseBody
    public Object save01(@Validated User user, BindingResult result, HttpServletRequest request){
       Map<String,Object> map = new HashMap<String, Object>();
        String username = user.getUsername();
        String password = user.getPassword();
        String id = UuidGeneter.uuidGenerator();
        request.setAttribute("id",id);
        User user1 = new User(id,username,password);
        System.out.println(result.getAllErrors());
        System.out.println(result);
        if (result.hasErrors()){
            List<FieldError> list =  result.getFieldErrors();
            for(FieldError error:list){
                System.out.println("错误字段名"+error.getField());
                System.out.println("错误信息"+error.getDefaultMessage());
                map.put("message",error.getField()+"="+error.getDefaultMessage());
                map.put("status",100);
            }
            return map;
        }else if(service01.insert(user1) == 1){
            map.put("status",200);
        }

       return map;
    }

    //修改功能
    @RequestMapping(value="/user/update/{id}" ,method = RequestMethod.PUT)
    @ResponseBody
    public Object update01(@PathVariable String id,User user){
        Map<String,String> map = new HashMap<String, String>();
        String username = user.getUsername();
        String password = user.getPassword();
        user.setId(id);
       if(1 == service01.update01(user)){
           map.put("shit","修改成功");
       }else {
           map.put("shit","修改失败");
       }
        return map;


    }


}
