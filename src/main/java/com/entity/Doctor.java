package com.entity;

public class Doctor {
	private int id;
	private String fullName;
	private String dob;
	private String qualification;
	private String specialty;
	private String email;
	private String contactNo;
	private String password;
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	

}
	public Doctor( String fullName, String dob, String qualification, String specialty, String email,
			String contactNo, String password) {
		super();
	
		this.fullName = fullName;
		this.dob = dob;
		this.qualification = qualification;
		this.specialty = specialty;
		this.email = email;
		this.contactNo = contactNo;
		this.password = password;
	}

	public Doctor(int id, String fullName, String dob, String qualification, String specialty, String email,
			String contactNo, String password) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.dob = dob;
		this.qualification = qualification;
		this.specialty = specialty;
		this.email = email;
		this.contactNo = contactNo;
		this.password = password;
	}
	
}