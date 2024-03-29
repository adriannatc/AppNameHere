package model;

abstract class Person {

	/**
	 * This class contains all of the relevant information, and getter/setter
	 * methods for the Member object.
	 */
	private int id;
	private String firstName;
	private String lastName;
	private String username;
	private String password;
	private String email;
	private boolean valid;
	///
	public String testMember(String text){
		return text;
	}
///
	public int getid() {
		return id;
	}

	public void setid(int memberid) {
		this.id = memberid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean newValid) {
		valid = newValid;
	}

//	@Override
//	public String toString() {
//		return "Member [userid=" + memberid + ", firstName=" + firstName
//				+ ", lastName=" + lastName + ", username=" + username
//				+ ", password=" + password + ", email=" + email + "]";
//	}
}
