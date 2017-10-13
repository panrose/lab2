package lab2;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
//change for egit
public class lab2Action {
	private String ISBN;
	private String Title;
	private String changeforgit;
	private String Author;
	private int AuthorID;
	private String Publisher;
	private String PublishDate;
	private String Price;
	private String Age;
	private String Country;
	private String name;
	private List<String> list_book = new LinkedList<String>();
	private List<String> db_book = new LinkedList<String>();
	private List<String> book_detail = new LinkedList<String>();
	ServletRequest request = ServletActionContext.getRequest();
	ServletRequest request2 = ServletActionContext.getRequest();
    HttpServletRequest req = (HttpServletRequest) request;
    HttpSession session = req.getSession();
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public int getAuthorID() {
		return AuthorID;
	}
	public void setAuthorID(int authorID) {
		AuthorID = authorID;
	}
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	public String getPublishDate() {
		return PublishDate;
	}
	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getAge() {
		return Age;
	}
	public void setAge(String age) {
		Age = age;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	
	public String Add()
	{
		Author = request.getParameter("author");
		ISBN = request.getParameter("isbn");
		Title = request.getParameter("title");
		Publisher = request.getParameter("publisher");
		PublishDate = request.getParameter("publishdate");
		String sql_exist = "SELECT * from author where name = \"" + Author + "\"";
		DBConnection c = new DBConnection();
		List<String> list_exist = c.select(sql_exist);
		if(list_exist.isEmpty())
		{
			return "AddAuthor";
		}	 
		List<String> list_authorid = c.select("select AuthorID from author where name = \"" + Author + "\"" );
		AuthorID = Integer.valueOf(list_authorid.get(0));
		
		String sql = "INSERT book VALUES(\"" + ISBN + "\",\""+Title+"\",\""+AuthorID+"\",\""+Publisher+"\",\""+PublishDate+"\",\""+Price+"\")";
		c.ope(sql);
		 
		return "SUCCESS";
	}
	public String Search()
	{
		DBConnection c = new DBConnection();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*try {
			Author = URLEncoder.encode(Author,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Author  =  new  String(request.getParameter("author").getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

		Author = request.getParameter("name");
		String sql_forID = "SELECT * from author where name = \"" + Author + "\"";
		String sql_book ="SELECT * from book where title = \"" + Author + "\"";
		List<String> list_author = c.select(sql_forID);
		List<String> se_book = c.select(sql_book);
		if(!list_author.isEmpty())
		{
			AuthorID = Integer.valueOf(list_author.get(0));
			String sql_forBook = "SELECT * from book where authorid = \"" + AuthorID + "\"";
			list_book = c.select(sql_forBook);

			List<String> temp = new LinkedList<String>();
			for(int i=2;i<list_book.size();i+=6)
			{
				AuthorID = Integer.valueOf(list_book.get(i));
				temp = c.select("select * from author where authorid = " + AuthorID );
				System.out.println("select * from author where authorid = " + AuthorID);
				list_book.set(i, temp.get(1));
			}
			
			session.setAttribute("list_book", list_book);
			return "SUCCESS";
		}
		else if(!se_book.isEmpty())
		{
			list_book.addAll(se_book);
			List<String> temp = new LinkedList<String>();
			for(int i=2;i<list_book.size();i+=6)
			{
				AuthorID = Integer.valueOf(list_book.get(i));
				temp = c.select("select * from author where authorid = " + AuthorID );
				System.out.println("select * from author where authorid = " + AuthorID);
				list_book.set(i, temp.get(1));
			}
			session.setAttribute("list_book", list_book);
			//session.setAttribute("se_book",se_book);
			return "SUCCESS";
		}
		else
		{
			session.setAttribute("list_book", list_book);
			return "Error";
		}
			
		
		
	}
	public String ShowDB()
	{
		DBConnection c = new DBConnection();
		List<String> temp = new LinkedList<String>();
		String db_id = "SELECT * from book";
		db_book = c.select(db_id);
		for(int i=2;i<db_book.size();i+=6)
		{
			AuthorID = Integer.valueOf(db_book.get(i));
			temp = c.select("select * from author where authorid = " + AuthorID );
			System.out.println("select * from author where authorid = " + AuthorID);
			db_book.set(i, temp.get(1));
		}
		session.setAttribute("db_book", db_book);
		return "SUCCESS";
	}
	public String AddAuthor()
	{
		int flag;
		DBConnection c= new DBConnection();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Author = request.getParameter("name");
		Age = request.getParameter("age");
		Country = request.getParameter("country");
		/*try {
			Author = new String(Author.getBytes("iso8859-1"),"utf-8");
			Age = new String(Age.getBytes("iso8859-1"),"utf-8");
			Country = new String(Country.getBytes("iso8859-1"),"utf-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		System.out.println("name:" + Author + "Age:"+Age + "country" + Country+"显示中文"); 
		
		List<String> author_exist = new LinkedList<String>();
		author_exist = c.select("SELECT * from author where name = \"" + Author +"\"");
		if(author_exist.isEmpty())
		{
			String sql_addau = "INSERT author VALUES(NULL,\""+ Author + "\",\"" + Age  + "\",\"" + Country+"\")";
			
			flag = c.ope(sql_addau);
			if(flag == 1) return "SUCCESS";
			else return "Error";
		}
		else
			return "author_exist";
			
		
		
	}
	public String Delete()
	{
		DBConnection c=  new DBConnection();
		/*try {
			ISBN = new String(ISBN.getBytes("iso8859-1"),"utf-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		/*try {
			//request.setCharacterEncoding("UTF-8");
			ISBN = URLEncoder.encode(ISBN,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		c.ope("delete from book where isbn = \"" + ISBN +"\"");
		return "SUCCESS" ;
	}
	public String Detail()  
	{	 
		DBConnection c= new DBConnection();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*try {
			Title = new String(Title.getBytes("iso8859-1"),"utf-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		String find_book = "SELECT * from book where title = \"" + Title +"\"";
		 book_detail = c.select(find_book);
		 List<String> temp = new LinkedList<String>();
			String db_id = "SELECT * from book";
			db_book = c.select(db_id);
			for(int i=2;i<book_detail.size();i+=6)
			{
				AuthorID = Integer.valueOf(book_detail.get(i));
				temp = c.select("select * from author where authorid = " + AuthorID );
				System.out.println("select * from author where authorid = " + AuthorID);
				book_detail.set(i, temp.get(1));
			}
		session.setAttribute("book_detail", book_detail);
		return "SUCCESS";
	}
	public String Update()
	{

		DBConnection c= new DBConnection();
		String oldID;
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Title = request.getParameter("title");
		Author = request.getParameter("author");
		Publisher = request.getParameter("publisher");
		PublishDate = request.getParameter("publishdate");
		Price = request.getParameter("price");
		
		System.out.println(Title+Author+Publisher+PublishDate+Price);
		
		/*try {
			Title = URLEncoder.encode(Title,"UTF-8");
			Author = URLEncoder.encode(Author,"UTF-8");
			Publisher = URLEncoder.encode(Publisher,"UTF-8");
			PublishDate = URLEncoder.encode(PublishDate,"UTF-8");
			Price = URLEncoder.encode(Price,"UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		String getisbn = "SELECT * from book where title = \"" + Title + "\"";
		List<String> list_isbn = c.select(getisbn);
		ISBN = list_isbn.get(0);
		if(!Author.equals(""))
		{
			//Author = request.getParameter("author");
			String exist_au = "SELECT * from author where name = \"" + Author + "\"";
			List<String> list_author = c.select(exist_au);
			if(list_author.isEmpty()) return "AddAuthor";
			else
			{
				int NewID = Integer.valueOf(list_author.get(0));
				String update_author = "UPDATE book SET authorid = " + NewID + " where title = \"" + Title + "\"";
				c.ope(update_author);
			}
		}
		if(!Publisher.equals(""))
		{
			//Publisher = request.getParameter("publisher");
			String update_publisher = "UPDATE book SET publisher = \"" + Publisher + "\" where title = \"" + Title + "\"";
			c.ope(update_publisher);
		}
		
		if(!PublishDate.equals(""))
		{
			//PublishDate = request.getParameter("publishdate");
			String update_publishdate = "UPDATE book SET publishdate = \"" + PublishDate + "\" where title = \"" + Title + "\"";
			c.ope(update_publishdate);
		}
		if(!Price.equals(""))
		{
			//Price = request.getParameter("price");
			String update_price = "UPDATE book SET price = \"" + Price + "\" where title = \"" + Title + "\"";
			c.ope(update_price);
		}
		return "SUCCESS";
		
	}
	
	
}
