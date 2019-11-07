package model;

public class Admin extends Person {
	
	@Override
	public String toString() {
		return "Admin [userid=" + this.getid() + ", firstName=" + this.getFirstName()
				+ ", lastName=" + this.getLastName() + ", username=" + this.getUsername()
				+ ", password=" + this.getPassword() + ", email=" + this.getEmail() + "]";
	}
}
