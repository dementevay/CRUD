package crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import crud.model.User;
import crud.service.UserService;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    private UserService userService;


    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getIndexPage(Model model) {
        return "index";
    }


    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getAllUsersList(@RequestParam(value = "page",defaultValue = "0",required = false) int page,
                                  @RequestParam Map<String, String> allRequestParams,
                                              Model model) {

        if (allRequestParams.isEmpty()) allRequestParams.put("page",Integer.toString(page));

        List<User> allUsers = userService.getAllUsersList();
        PagedListHolder<User> usersPages = new PagedListHolder<User>(allUsers);
        usersPages.setPageSize(5);
        usersPages.setPage(page);
        String nextPageRequest=pageRequestModifier(allRequestParams,page+1);
        String prevPageRequest=pageRequestModifier(allRequestParams,page-1);
        model.addAttribute("nextPageRequest",nextPageRequest);
        model.addAttribute("prevPageRequest",prevPageRequest);
        model.addAttribute("usersPages", usersPages);


        return "users";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addAction(@ModelAttribute("user") User user, Model model) {

        if (user.getName()==null||user.getName().isEmpty()||user.getAge()<0){
            model.addAttribute("isInvalidArguments",true);
            model.addAttribute("user",user);
            return "addForm";
        }
        userService.addUser(user);
        return "redirect:/users";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "addForm";
    }

    @RequestMapping(value = "/remove={id}")
    public String removerUser(@PathVariable("id") int id) {
        userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "/edit={id}", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", userService.getUserById(id));

        return "editForm";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("user") User user, Model model) {

        if (user.getName()==null||user.getName().isEmpty()||user.getAge()<0){
            model.addAttribute("isInvalidArguments",true);
            model.addAttribute("user",user);
            return "editForm";
        }

        userService.updateUser(user);
        return "redirect:/users";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchRequestHandler(@RequestParam("name") String name,
                                       @RequestParam(value = "page", defaultValue = "0") int page,
                                       @RequestParam("ageFrom") Integer ageFrom,
                                       @RequestParam("ageUntil") Integer ageUntil,
                                       @RequestParam("isAdmin") Boolean isAdmin,
                                      // @RequestParam("after") @DateTimeFormat(pattern = "yyyy-MM-dd") Date after,
                                       //@RequestParam("before") @DateTimeFormat(pattern = "yyyy-MM-dd") Date before,
                                       @RequestParam Map<String, String> allRequestParams,
                                       Model model) {
        List<User> resultList = userService.searchUsers(name, ageFrom, ageUntil, isAdmin);//, after, before);
        PagedListHolder<User> usersPages = new PagedListHolder<User>(resultList);
        usersPages.setPageSize(5);
        usersPages.setPage(page);
        String nextPageRequest=pageRequestModifier(allRequestParams,page+1);
        String prevPageRequest=pageRequestModifier(allRequestParams,page-1);
        model.addAttribute("nextPageRequest",nextPageRequest);
        model.addAttribute("prevPageRequest",prevPageRequest);
        model.addAttribute("resultPages", usersPages);
        return "search";
    }
    @ExceptionHandler(Exception.class)
    public String handleException(Exception exception,Model model){
        model.addAttribute("message",exception.getMessage());
        return "error";
    }

    private static String pageRequestModifier(Map<String, String> allRequestParams, int page) {
        if (allRequestParams != null && !allRequestParams.isEmpty() && allRequestParams.containsKey("page")) {
            allRequestParams.put("page", Integer.toString(page));
            StringBuilder stringBuilder = new StringBuilder("?");
            for (Map.Entry<String, String> entry : allRequestParams.entrySet()) {
                stringBuilder.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
          return   stringBuilder.substring(0, stringBuilder.length() - 1);

        } else return "";
    }

}
