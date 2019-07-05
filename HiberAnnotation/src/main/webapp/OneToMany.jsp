<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.hibernate.*, 
    org.hibernate. cfg.Configuration, 
     java.util.*,
     com.lti.hiber.Question,
     com.lti.hiber.Answer,
      org.hibernate.boot.Metadata,
      org.hibernate.boot.MetadataSources,
      org.hibernate.boot.registry.StandardServiceRegistryBuilder,
      org.hibernate.boot.registry.StandardServiceRegistry,
      javax.persistence.TypedQuery" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Configuration configuration = new Configuration();
configuration.configure("hibernate.cfg.xml");
SessionFactory factory = configuration.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
Session sess= factory.openSession();
sess.beginTransaction();

Answer ans1=new Answer();
ans1.setAnswername("HTML is a static Language ");
ans1.setPostedBy("APARNA");


Answer ans2=new Answer();
ans2.setAnswername("JS is GOOD ");
ans2.setPostedBy("JoY ");


Answer ans3=new Answer();
ans3.setAnswername("JS is a Language ");
ans3.setPostedBy(" Know");


Answer ans4=new Answer();
ans4.setAnswername("JS is DIFFERENT");
ans4.setPostedBy("YOU know that?");

ArrayList<Answer> list1=new ArrayList<Answer>();
list1.add(ans1);
list1.add(ans2);
list1.add(ans4);

ArrayList<Answer> list2=new ArrayList<Answer>();
list2.add(ans1);
list2.add(ans2);

Question question1=new Question();
question1.setQname("WHAT IS HTML?");
question1.setAnswers(list1);


Question question2=new Question();
question2.setQname("WHAT IS JAVASCRIPT?");
question2.setAnswers(list2);

sess.persist(question1);
sess.persist(question2);


sess.getTransaction().commit();


out.println("table created n record successfully inserted");
out.println("<br>********************Display Data*************************<br>");
TypedQuery<Question> query=sess.createQuery("from Question",Question.class);
List<Question>list = query.getResultList();
Iterator<Question> itr= list.iterator();
while(itr.hasNext()){
	Question q=itr.next();
	out.println("<br>"+"Question Name:"+q.getQname());
	List<Answer> list3=q.getAnswers();
	Iterator<Answer> itr2=list3.iterator();
	while(itr2.hasNext())
	{
		Answer a=itr2.next();
		out.println("<br>"+a.getAnswername()+":"+a.getPostedBy());
		
	}
	out.println("<br>");
}
sess.close();
System.out.println("success");

%>

</body>
</html>