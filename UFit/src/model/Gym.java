package model;

public class Gym {
	
	private String nameGym;
	private String postalCode;
	private String gymLink;
	
	public Gym(String nameGym, String postalCode, String gymLink) {
		
		this.nameGym = nameGym;
		this.postalCode = postalCode;
		this.gymLink = gymLink;
	}

	public String getNameGym() {
		return nameGym;
	}

	public void setNameGym(String nameGym) {
		this.nameGym = nameGym;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getGymLink() {
		return gymLink;
	}

	public void setGymLink(String gymLink) {
		this.gymLink = gymLink;
	}
	
	@Override
    public String toString() {
           return "Gym [Name of the Gym: " + nameGym + ", Postal Code: " + postalCode
                        + ", Gym's Website Link: " + gymLink + "]";
    }
	
	
	
}
