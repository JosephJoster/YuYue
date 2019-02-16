package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//useUnicode=true&characterEncoding=UTF-8;

public class DBHelper {
	private static final String driver = "com.mysql.cj.jdbc.Driver";//数据库驱动
	//连接数据库的URL地址
	private static final String url = "jdbc:mysql://localhost:3306/my_database?"
			+ "&useSSL=true&serverTimezone=GMT";
	//my_database是我schema的名字
	private static final String username = "root";//数据库用户名
	private static final String password = "1234";//数据库密码
	private static Connection conn = null;
	
	//静态代码块加载驱动
	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//单例模式返回数据库连接对象
	public static Connection getConnection() throws SQLException {
		if (conn == null) {
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		return conn;
	}
	
	public static void main(String[] args) {
		try {
			Connection conn = DBHelper.getConnection();
			if (conn!=null) {
				System.out.println("数据库连接成功");
			} else {
				System.out.println("数据库连接异常");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

