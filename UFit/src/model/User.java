package model;

import java.util.Date;

public class User {

	private String  firstname;
	private String  lastname;
	private int	    userID;
	private String  gymname;
	private String  postalCode;
	private String  emailAddress;
	private String  password;
	private String  username;
	private boolean valid;
	
	//initialize empty user object
	public User(){
	}
//	
//	public User(int memberID, String firstname, String lastname, String username, String password, String emailAddress, String gymname, String postalCode, boolean valid) {
//		
//		this.firstname = firstname;
//		this.lastname = lastname;
//		this.userID = memberID;
//		this.gymname = gymname;
//		this.postalCode = postalCode;
//		this.emailAddress = emailAddress;
//		this.password = password;
//		this.username = username;
//		this.valid = valid;
//		
//	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int memberID) {
		this.userID = memberID;
	}

	public String getGymname() {
		return gymname;
	}

	public void setGymname(String gymname) {
		this.gymname = gymname;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	@Override
    public String toString() {
           return "User [userid: " + userID + ", firstname: " + firstname
                        + ", lastname: " + lastname + ", username: " + username
                        + ", password: " + password + ", email: " + emailAddress + ", Preferred Gym: " + gymname + ", Postal Code: " + postalCode + "]";
    }
	

	
	
	
	
	

}
