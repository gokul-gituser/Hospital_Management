package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialty;

public class SpecialtyDao {
	private Connection conn;

	public SpecialtyDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean addSpecialty(String spec) {
		boolean f= false;
		try {
			String sql = "insert into specialty(spec_name) values(?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, spec);
			
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			
		}
		return f;
	}
	
	public List<Specialty> getAllSpecialty(){
		List<Specialty> list = new ArrayList<Specialty>();
		Specialty s= null;
		
		try {
			String sql= "select * from specialty";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				s=new Specialty();
				s.setId(rs.getInt(1));
				s.setSName(rs.getString(2));
				list.add(s);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
