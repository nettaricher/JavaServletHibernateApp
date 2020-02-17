package model;
/**
 * Model for database table users
 * @author Netta Richer
 * @author Sagi Granot
 *
 */
public class User {
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;

    public User() {
    }
    /**
     * User construtor
     * @param firstname string representation for user's first name
     * @param lastname string representation for user's last name
     * @param email string representation for user's email address
     * @param password string representation for user's plain password
     *
     * @see model.User
     */
    public User(String firstname, String lastname, String email, String password) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
