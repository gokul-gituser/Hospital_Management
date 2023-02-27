package com.entity;

public class Specialty {
	private int id;
	private String SName;
	
	public Specialty(int id, String SName) {
		super();
		this.id = id;
		this.SName = SName;
	}
	
	

	public Specialty() {
		super();
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSName() {
		return SName;
	}

	public void setSName(String SName) {
		this.SName = SName;
	}
	
	
}
