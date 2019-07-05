<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="org.hibernate.*, 
    org.hibernate. cfg.Configuration, 
     java.util.*,
     com.lti.hiber.Department,
     com.lti.hiber.Employee1,
      org.hibernate.boot.Metadata,
      org.hibernate.boot.MetadataSources,
      org.hibernate.boot.registry.StandardServiceRegistryBuilder,
      org.hibernate.boot.registry.StandardServiceRegistry,
      javax.persistence.TypedQuery" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<% 
Configuration configuration = new Configuration();
configuration.configure("hibernate.cfg.xml");
SessionFactory factory = configuration.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
Session sess= factory.openSession();
sess.beginTransaction();

Employee1 emp1=new Employee1();
emp1.setEname("cvb ");
emp1.setDesig("IT");


Employee1 emp2=new Employee1();
emp2.setEname("abc ");
emp2.setDesig("CSE");

Employee1 emp3=new Employee1();
emp3.setEname("ghj ");
emp3.setDesig("mech");

Employee1 emp4=new Employee1();
emp4.setEname("jmjj ");
emp4.setDesig("civil");

ArrayList<Employee1> list1=new ArrayList<Employee1>();
list1.add(emp1);
list1.add(emp2);
list1.add(emp3);

ArrayList<Employee1> list2=new ArrayList<Employee1>();
list2.add(emp1);
list2.add(emp2);

Department d1=new Department();
d1.setDname("jony");
d1.setEmployee1(list1);

Department d2=new Department();
d2.setDname("tony");
d2.setEmployee1(list2);


sess.persist(d1);
sess.persist(d2);


sess.getTransaction().commit();


out.println("table created n record successfully inserted");
out.println("<br>********************Display Data*************************<br>");
TypedQuery<Department> query=sess.createQuery("from Department",Department.class);
List<Department>list = query.getResultList();
Iterator<Department> itr= list.iterator();
while(itr.hasNext()){
	Department q=itr.next();
	out.println("<br>"+"Department Name:"+q.getDname());
	List<Employee1> list3=q.getEmployee1();
	Iterator<Employee1> itr2=list3.iterator();
	while(itr2.hasNext())
	{
		Employee1 a=itr2.next();
		out.println("<br>"+a.getEname()+":"+a.getDesig());
		
	}
	out.println("<br>");
}
sess.close();
System.out.println("success");

%>
</body>
</html>