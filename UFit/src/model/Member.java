package model;

import java.util.Date;

public class Member extends Person {
	

	@Override
	public String toString() {
		return "Member [userid=" + this.getid() + ", firstName=" + this.getFirstName()
				+ ", lastName=" + this.getLastName() + ", username=" + this.getUsername()
				+ ", password=" + this.getPassword() + ", email=" + this.getEmail() + "]";
	}
}