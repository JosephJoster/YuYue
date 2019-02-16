package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import util.DBHelper;

public class AppointDao {
	public void main(String[] args) {
	}
	
	public String[] getNextDays() {
		final int lengthOfDays = 3;
		String[] nextDays = new String[lengthOfDays];
		Date date = new Date();
		long nowMillis = date.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < lengthOfDays; i++) {
			date.setTime(nowMillis + (i + 1) * 86400000L);
			// 86400000代表1天的毫秒数，注意后面这个L
			nextDays[i] = sdf.format(date);
		}
		return nextDays;
	}

	/**
	 * @return 1 成功， 2该时间段已经被预约， -1无效请求，-2链接异常
	 */
	public int appoint(String device_id, String date, String time, String username) {
		if (device_id == null || date == null || time == null || username == null || device_id.equals("")
				|| date.equals("") || time.equals("") || username.equals("")) {
			return -1;
		}
		int id = Integer.parseInt(device_id);
		int time_id = Integer.parseInt(time);
		// 1上午，2下午，3晚上
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			// 先看时间段是否已经被预约
			String sql = "SELECT username FROM appointments_record WHERE (device_id = ? AND appointment_date = ? AND appointment_time = ?);";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setString(2, date);
			stmt.setInt(3, time_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return 2;
			}
			// 执行预约;			
			sql = "INSERT INTO appointments_record (device_id, username, appointment_date, appointment_time) VALUES (?, ?, ?, ?);";
			stmt.close();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setString(2, username);
			stmt.setString(3, date);
			stmt.setInt(4, time_id);
			stmt.execute();
			return 1;
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
		return -2;
	}
	
	public ArrayList<Record> getMyAppointments(String username) {
		ArrayList<Record> list = new ArrayList<Record>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "SELECT * FROM appointments_record WHERE username = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Record record = new Record();
				record.setDevice_id(rs.getInt("device_id"));
				record.setDate(rs.getString("appointment_date"));
				record.setTime(rs.getInt("appointment_time"));
				list.add(record);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		}
		return list;
	}


}
