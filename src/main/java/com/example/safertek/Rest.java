package com.example.safertek;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Rest {
	
	ArrayList<Employee> emps=new ArrayList<Employee>();
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/employee")
	public String employee(Model model) {
		model.addAttribute("emps",emps);
		return "employees";
	}
	
	@GetMapping("/add")
	public String add() {
		return "add";
	}
	
	public static final String capitalize(String str)   
	{  
	if (str == null || str.length() == 0) return str;  
	return str.substring(0, 1).toUpperCase() + str.substring(1);  
	} 
	
	@PostMapping("/addEmployee")
	public String addEmp(@ModelAttribute("employ") Employee e) {
		int l=emps.size();
		e.setId(l+1);
		if(e.getAge()>40) {
			e.setPos("Sr. Employee");
			e.setSalary((double)e.getAge()*10+50);
		}
		else {
			e.setPos("Jr. Employee");
			e.setSalary(e.getAge()*5+50);
		}
		e.setFn(capitalize(e.getFn()));
		e.setLn(capitalize(e.getLn()));
		emps.add(e);
		return "redirect:/employee";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		if(id!=emps.size()) {
			for(int i=id;i<emps.size();i++) {
				emps.get(i).setId(emps.get(i).getId()-1);
			}
		}
		emps.remove(id-1);
		return "redirect:/employee";
	}
	
	@GetMapping("/eform/{id}")
	public String eform(@PathVariable int id,Model model) {
		model.addAttribute("emp",emps.get(id-1));
		return "eform";
	}
	
	@PostMapping("/edit/{id}")
	public String edit(@PathVariable int id,@ModelAttribute("newe") Employee nemp) {
		emps.get(id-1).setFn(nemp.getFn());
		emps.get(id-1).setLn(nemp.getLn());
		emps.get(id-1).setAge(nemp.getAge());
		emps.get(id-1).setDept(nemp.getDept());
		return "redirect:/employee";
	}
	
	

}
