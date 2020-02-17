package dao.test;

import dao.UserDao;
import model.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDaoTest {
    private UserDao userDao;

    @Before
    public void setUp() throws Exception {
        userDao = new UserDao();
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void saveUser() {
        User user = new User("test","test","test@test.com","test");
        assertEquals(userDao.saveUser(user), true);
    }

    @Test
    public void validate() {
        assertEquals(userDao.validate("Not","Exists"), false);
        assertEquals(userDao.validate("test@test.com","test"), true);
    }
}