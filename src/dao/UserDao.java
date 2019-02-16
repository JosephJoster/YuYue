package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.DBHelper;

public class UserDao {

	public UserDao() {
	}

	/**
	 * @param username
	 * @param password
	 * @return 1：用户名存在 2：注册成功 3：链接异常
	 */
	public int register(String username, String password) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			// 先确认用户名是否重复
			String sql = "select id from users where username = ?;";// SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return 1;
			} else {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String creat_date = simpleDateFormat.format(new Date());
				sql = "INSERT INTO users (username, password, creat_date) VALUES (?, ?, ?);";
				stmt.close();				
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, username);
				stmt.setString(2, password);
				stmt.setString(3, creat_date);
				stmt.execute();
				return 2;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 释放数据集
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 3;
	}

	/**
	 * only English letter and Arabic numerals is allowed
	 * 
	 * @return
	 */
	public boolean isValidChar(String str) {
		char[] list = str.toCharArray();
		for (char c : list) {
			if (c >= '0' && c <= '9') {
			} else {
				if (c >= 'A' && c <= 'Z') {
				} else {
					if (c >= 'a' && c <= 'z') {
					} else {
						return false;
					}
				}
			}
		}
		return true;
	}

	/**
	 * Login
	 */
	public boolean userLogin(String username, String password) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select password from users where username = ?;";// SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 释放数据集
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
}
