package com.lti.hiber;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee100")
public class Employee1 {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int id;
	private String Ename;
	private String Desig;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEname() {
		return Ename;
	}
	public void setEname(String ename) {
		Ename = ename;
	}
	public String getDesig() {
		return Desig;
	}
	public void setDesig(String desig) {
		Desig = desig;
	}


}
