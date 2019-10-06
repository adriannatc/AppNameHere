package model;

public class Class extends Gym{
	
	private String category;
	private String trainerName;
	private String trainerGender;
	private String classDescription;
	private String level;
	private String rating;
	
	

	public Class(String category, String nameGym, String postalCode, String trainerName, String trainerGender, String classDescription, String level, String rating, String gymLink) {
		super(nameGym, postalCode, gymLink);
		this.category         = category;
		this.trainerName      = trainerName;
		this.trainerGender    = trainerGender;
		this.classDescription = classDescription;
		this.level            = level;
		this.rating           = rating;
		
		
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getTrainerName() {
		return trainerName;
	}



	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}



	public String getTrainerGender() {
		return trainerGender;
	}



	public void setTrainerGender(String trainerGender) {
		this.trainerGender = trainerGender;
	}



	public String getClassDescription() {
		return classDescription;
	}



	public void setClassDescription(String classDescription) {
		this.classDescription = classDescription;
	}



	public String getLevel() {
		return level;
	}



	public void setLevel(String level) {
		this.level = level;
	}



	public String getRating() {
		return rating;
	}



	public void setRating(String rating) {
		this.rating = rating;
	}
	
	@Override
    public String toString() {
           return "Class [Category: " + category + ", Name of the Gym: " + getNameGym()
                        + ", Postal Code of the Gym: " + getPostalCode() + ", Trainer Name: " + trainerName
                        + ", Trainer Gender: " + trainerGender + ", Description of the Class: " + classDescription + "]";
    }
	
	

}
