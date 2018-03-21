package com.rest.profesor.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.NONE)
@XmlRootElement(name="profesor")

public class Profesor {
	public String profID;
	public String name;
	public String email;
	
	@XmlElement(required=true)
	public String getProfID() {
		return profID;
	}
	
	public void setProfID(String profID) {
		this.profID = profID;
	}
	
	@XmlElement(required=true)
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@XmlElement(required=true)
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
