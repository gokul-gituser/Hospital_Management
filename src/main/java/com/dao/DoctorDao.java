package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn=conn;
	}
	public boolean registerDoctor(Doctor d) {
		boolean f= false;
		try {
			String sql="insert into doctors(full_name,dob,qualification,specialty,email,contactNo,password) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialty());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getContactNo());
			ps.setString(7, d.getPassword());
			
			int i =ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public List<Doctor> getAllDoctor(){
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d = null;
		try {
			String sql = "select * from doctors order by id desc";
			PreparedStatement ps= conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialty(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setContactNo(rs.getString(7));
				d.setPassword(rs.getString(8));
				
				list.add(d);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public Doctor getDoctorById(int id){
		
		Doctor d = null;
		try {
			String sql = "select * from doctors where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialty(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setContactNo(rs.getString(7));
				d.setPassword(rs.getString(8));
				
				
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public boolean updateDoctor(Doctor d) {
		boolean f= false;
		try {
			String sql="update doctors set full_name=?,dob =?,qualification=?,specialty=?,email=?,contactNo=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialty());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getContactNo());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());
			
			int i =ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public boolean deleteDoctor(int id) {
		boolean f=false;
		try {
			String sql= "delete from doctors where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Doctor login(String email,String psw) {
		Doctor d=null;
		try {
			String sql = "select * from doctors where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialty(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setContactNo(rs.getString(7));
				d.setPassword(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public int countDoctor() {
		int i=0;
		try {
			String sql = "select * from doctors";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	
	public int countAppointment() {
		int i=0;
		try {
			String sql = "select * from appointment";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	
	public int countUser() {
		int i=0;
		try {
			String sql = "select * from users";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	
	public int countSpecialty() {
		int i=0;
		try {
			String sql = "select * from specialty";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	
	public int countAppointmentByDoctorId(int did) {
		int i=0;
		try {
			String sql = "select * from appointment where doctor_id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	
	public boolean checkOldPassword(int doctorId,String oldPassword) {
		boolean f=false;
		try {
			String sql = "select * from doctors where id=? and password=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, doctorId);
			ps.setString(2, oldPassword);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean changePassword(int doctorId,String newPassword) {
		boolean f=false;
		try {
			String sql = "update doctors set password=? where id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, doctorId);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean editDoctorProfile(Doctor d) {
		boolean f= false;
		try {
			String sql="update doctors set full_name=?,dob =?,qualification=?,specialty=?,email=?,contactNo=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialty());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getContactNo());
			ps.setInt(7, d.getId());
			
			int i =ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	 
}
