package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Device;
import util.DBHelper;

public class DeviceDao {
	
	public Device getDevice(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from devices where id = ?;";// SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				Device device = new Device();
				device.setId(id);
				device.setName(rs.getString("name"));
				device.setBuy_date(rs.getString("buy_date"));
				device.setContacts(rs.getString("contacts"));
				device.setEmail(rs.getString("email"));
				device.setFrom(rs.getString("from"));
				device.setModel(rs.getString("model"));
				device.setNote(rs.getString("note"));
				device.setTel(rs.getString("tel"));
				return device;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
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
	}

//	public static void main(String[] args) {
//		DeviceDao deviceDao = new DeviceDao();
//		Device device = deviceDao.getDevice(1);
//		System.out.println(device.getNote());
//	}

}

