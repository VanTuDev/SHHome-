package com.example.demo.Service;



import com.example.demo.beans.User;
import com.example.demo.dao.UserDAO;

import java.util.Optional;

public class UserService extends Service<User, UserDAO> implements UserDAO{
    public UserService() {
        super(UserDAO.class);
    }

    @Override
    public Optional<User> getByUsername(String username) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByUsername(username));
    }

    @Override
    public void changePassword(long userId, String newPassword) {
        jdbi.useExtension(UserDAO.class, dao -> dao.changePassword(userId, newPassword));
    }

    @Override
    public Optional<User> getByEmail(String email) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByEmail(email));

    }

    @Override
    public Optional<User> getByPhoneNumber(String phoneNumber) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByPhoneNumber(phoneNumber));
    }

    @Override
    public int count() {
        return jdbi.withExtension(UserDAO.class, UserDAO::count);
    }

    @Override
    public Optional<User> getByUserId(long id) {
        return jdbi.withExtension(UserDAO.class, dao -> dao.getByUserId(id));
    }
}
