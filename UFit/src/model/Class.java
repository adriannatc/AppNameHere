/** we don't need this class*/

package model;

import java.util.Date;

public class Class {
	
	
	/**
	 * This class contains all of the relevant information, and getter/setter
	 * methods for the Student object.
	 */

	private int classid;
	private String category;
	private String location;
	private Date gdate;
	private String level;

	public int getClassid() {
		return classid;
	}

	public void setClassid(int classid) {
		this.classid = classid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getGdate() {
		return gdate;
	}

	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "Class [classid=" + classid + ", category=" + category
				+ ", location=" + location + ", gdate=" + gdate + ", level="
				+ level + "]";
	}
	
	
	
}