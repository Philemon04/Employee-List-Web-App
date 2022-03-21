package emp;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/")
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDao employeeDAO;

	public void init() {
		employeeDAO = new EmployeeDao();
	}

	public EmpServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String nid = request.getParameter("id");
//		int id  = Integer.parseInt(nid);
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/new":	
				newForm(request, response);
				break;
			case "/update":
				update(request, response);
				break;
			case "/delete":
				delete(request, response);
				break;
			case "/insert":
				insert(request, response);
				break;
			case "/edit":
				viewForm(request, response);
				break;
			default:
				listEmployee(request, response);
				break;
			}
		} catch (SQLException | ClassNotFoundException e) {
			throw new ServletException(e);
		}

	}

	public void newForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, ClassNotFoundException, IOException, SQLException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("AddUser.jsp");
		dispatcher.forward(request, response);
	}

	public void viewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, ClassNotFoundException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee changeEmp = employeeDAO.selectEmpbyID(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeForm.jsp");
		request.setAttribute("employee", changeEmp);
		dispatcher.forward(request, response);
	}

	public void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, ClassNotFoundException, IOException, SQLException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String gender = request.getParameter("gender");
		String empage = request.getParameter("age");
		int age = Integer.parseInt(empage);
		Employee emp = new Employee(firstname, lastname, email, phonenumber, gender, age);
		employeeDAO.insert(emp);
		response.sendRedirect("list");
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, ClassNotFoundException, IOException, SQLException {
		String empid = request.getParameter("id");
		int id = Integer.parseInt(empid);
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String gender = request.getParameter("gender");
		String empage = request.getParameter("age");
		int age = Integer.parseInt(empage);
		Employee emp = new Employee(id, firstname, lastname, email, phonenumber, gender, age);
		employeeDAO.update(emp);
		System.out.println("::::::update successfully:::::::::::::::::::::::::::::::::::::::;");
		response.sendRedirect("list");
	}

	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, ClassNotFoundException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		employeeDAO.delete(id);
		response.sendRedirect("list");
	}

	public void listEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		System.out.println("::::::populating list done:::::::::::::::::::::::::::::::::::::::;");

		List<Employee> listEmployee = employeeDAO.selectEmp();
		System.out.println("The size of employees here is:::::::" + listEmployee.size());
		request.setAttribute("listEmployee", listEmployee);
		RequestDispatcher dispatcher = request.getRequestDispatcher("User-list.jsp");
		dispatcher.forward(request, response);
	}

}
