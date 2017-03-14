package crud.service;


import crud.model.User;

import java.util.Date;
import java.util.List;

public interface UserService {
    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> getAllUsersList();

    List<User> searchUsers(String name, Integer ageFrom, Integer ageUntil, Boolean isAdmin);//, Date after, Date before

}
