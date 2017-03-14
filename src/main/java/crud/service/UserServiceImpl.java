package crud.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import crud.dao.UserDao;
import crud.model.User;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        userDao.updateuser(user);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        userDao.removeUser(id);
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> getAllUsersList() {
        return userDao.getAllUsersList();
    }

    @Override
    @Transactional
    public List<User> searchUsers(String name, Integer ageFrom, Integer ageUntil, Boolean isAdmin) {//, Date after, Date before
        return userDao.searchUsers(name, ageFrom, ageUntil, isAdmin);//, after, before
    }
}
