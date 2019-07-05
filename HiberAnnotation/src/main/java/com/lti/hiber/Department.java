package com.lti.hiber;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import javax.persistence.Table;
@Entity
@Table(name="department100")
public class Department {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int id;
	
private String Dname;

@OneToMany(cascade = CascadeType.ALL)
@JoinColumn(name="Did")
private List<Employee1> employee1;

public int getid() {
	return id;
}
public void setid(int id) {
	this.id = id;
}
public String getDname() {
	return Dname;
}
public void setDname(String dname) {
	this.Dname = dname;
}
public List<Employee1> getEmployee1() {
	return employee1;
}
public void setEmployee1(List<Employee1> employee1) {
	this.employee1 = employee1;
}
}
