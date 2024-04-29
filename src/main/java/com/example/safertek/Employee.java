package com.example.safertek;

public class Employee {
	
	int id,age;String fn,ln,dept,gender;double salary;
	String pos;


	public String getPos() {
		return pos;
	}



	public void setPos(String pos) {
		this.pos = pos;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public String getFn() {
		return fn;
	}



	public void setFn(String fn) {
		this.fn = fn;
	}



	public String getLn() {
		return ln;
	}



	public void setLn(String ln) {
		this.ln = ln;
	}



	public String getDept() {
		return dept;
	}



	public void setDept(String dept) {
		this.dept = dept;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public double getSalary() {
		return salary;
	}



	public void setSalary(double salary) {
		this.salary = salary;
	}



	public Employee(int id,String fn, String ln,String gender,int age, double salary,String dept,String pos) {
		super();
		this.id = id;
		this.age = age;
		this.fn = fn;
		this.ln = ln;
		this.dept = dept;
		this.gender = gender;
		this.salary = salary;
		this.pos=pos;
	}
	
	public Employee() {
		
	}

}
