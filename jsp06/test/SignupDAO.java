package web.jsp06.test;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SignupDAO {
	
	//커넥션 메서드
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		return ds.getConnection();
				
	}
	
	
	//회원 가입 메서드
	public void insertForm(SignupVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null; //finally에서 닫아주기위해
		
		
		try {
			conn = getConnection();
			String sql = "insert into signup values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, vo.getId());
			pstmt.setNString(2, vo.getPw());
			pstmt.setNString(3, vo.getName());
			pstmt.setNString(4, vo.getEmail());
			pstmt.setNString(5, vo.getGender());
			pstmt.setNString(6, vo.getMusic());
			pstmt.setNString(7, vo.getSports());
			pstmt.setNString(8, vo.getTravel());
			pstmt.setNString(9, vo.getMovies());
			pstmt.setNString(10, vo.getBirthYY());
			pstmt.setNString(11, vo.getBirthMM());
			pstmt.setNString(12, vo.getBirthDD());
			pstmt.setNString(13, vo.getJob());
			pstmt.setNString(14, vo.getBio());
			
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try{pstmt.close();}catch(Exception e){e.printStackTrace();}
			if(conn != null) try{conn.close();}catch(Exception e){e.printStackTrace();}
		}
		
	}
	
	
	//회원 전체 정보 가져오는 메서드
	
	//리턴은 하나밖에 못해서 한번에 묶어서 리턴
	public List selectAll() {
		List list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from signup");
			rs = pstmt.executeQuery();
			list = new ArrayList();
			while(rs.next()) {
				SignupVO vo = new SignupVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setMusic(rs.getString("music"));
				vo.setSports(rs.getString("sports"));
				vo.setTravel(rs.getString("travel"));
				vo.setMovies(rs.getString("movies"));
				vo.setBirthYY(rs.getString("birthYY"));
				vo.setBirthMM(rs.getString("birthMM"));
				vo.setBirthDD(rs.getString("birthDD"));
				vo.setJob(rs.getString("job"));
				vo.setBio(rs.getString("bio"));
				vo.setReg(rs.getTimestamp("reg"));
				list.add(vo);// 리스트에 추가
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)try {rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return list;
	}
	
	
	// 이메일 수정 메서드
	
	public int updateEmail(String id, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			conn = getConnection();
			String sql = "update signup set email=? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
			pstmt.setString(2,id);
			
			result = pstmt.executeUpdate();
			System.out.println("Update Result :" +result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(Exception e) {e.printStackTrace();}
		}
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
}
