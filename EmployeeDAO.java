package emp;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

	public String dbname = "jdbc:mysql://localhost:3306/emp";
	public String dbuser = "root";
	public String dbpass = "";
	public String dbdriver = "com.mysql.jdbc.Driver";
	
	public void loadDriver(String dbdriver) {
		try {
			Class.forName(dbdriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection connection() throws ClassNotFoundException {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbname, dbuser, dbpass);
		} catch (SQLException e) {
			System.out.println(e);
			;
		}
		return con;
	}

	public int insert(Employee emp) throws ClassNotFoundException, SQLException {
		System.out.println("::::::BEGIN OF INSERT::::::");
		loadDriver(dbdriver);
		int done = 0;
		Connection con = connection();
		String sql = "insert into employee(firstname,lastname,email,phonenumber,gender,age) values(?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("::::::middle OF INSERT::::::");
		ps.setString(1, emp.getFirstname());
		ps.setString(2, emp.getLastname());
		ps.setString(3, emp.getEmail());
		ps.setString(4, emp.getPhonenumber());
		ps.setString(5, emp.getGender());
		ps.setLong(6, emp.getAge());
		done = ps.executeUpdate();
		return done;
	}

	public Employee selectEmpbyID(int id) throws SQLException, ClassNotFoundException {
		loadDriver(dbdriver);
		Employee emp = null;
		Connection con = connection();
		String sql = "select * from employee where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			String firstname = rs.getString("firstname");
			String lastname = rs.getString("lastname");
			String email = rs.getString("email");
			String phonenumber = rs.getString("phonenumber");
			String gender = rs.getString("gender");
			int age = rs.getInt("age");
			emp = new Employee(id,firstname,lastname,email,phonenumber,gender,age);
		}
		return emp;
	}
	public List<Employee> selectEmp() throws SQLException, ClassNotFoundException{
		loadDriver(dbdriver);
		List<Employee> employees = new ArrayList<>();
		Connection con = connection();
		String sql = "select * from employee";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
//			Employee emp = new Employee();
			int id = rs.getInt("id");
			String firstname = rs.getString("firstname");
			String lastname = rs.getString("lastname");
			String email = rs.getString("email");
			String phonenumber = rs.getString("phonenumber");
			String gender = rs.getString("gender");
			int age = rs.getInt("age");
			employees.add(new Employee(id,firstname,lastname,email,phonenumber,gender,age));
			System.out.println("Employees no is" +employees.size());
	}
		return employees;
	}
	public int delete(int id) throws ClassNotFoundException, SQLException {
		loadDriver(dbdriver);
		int done = 0;
		Connection con = connection();
		String sql = "delete from employee where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		done = ps.executeUpdate();
		return done;
	}
	public int update(Employee emp) throws ClassNotFoundException,SQLException {
		int done= 0;
		Connection con = connection();
		String sql = "update employee set firstname=?,lastname=?,email=?,phonenumber=?, gender=?, age=?  where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, emp.getFirstname());
		ps.setString(2, emp.getLastname());
		ps.setString(3,  emp.getEmail());
		ps.setString(4, emp.getPhonenumber());
		ps.setString(5, emp.getGender());
		ps.setInt(6, emp.getAge());
		ps.setInt(7, emp.getId());
		done = ps.executeUpdate();
		return done;
		
	}
}
