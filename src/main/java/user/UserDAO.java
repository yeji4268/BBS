package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bbs.Bbs;

public class UserDAO {

	 private Connection conn;
	 private PreparedStatement pstmt;
	 private ResultSet rs;
	
	 //생성자 
	 public UserDAO() {
	  try {
		  String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
		  String dbID = "root";
		  String dbPassword = "g0001092^^";
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	
	  } catch (Exception e) {
		  e.printStackTrace();
	  	}
	 }
	
	 //로그인 
	 public int login(String userID, String userPassword) {
		 String SQL = "SELECT userPassword FROM USER WHERE userID=?";
		 try {
			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, userID);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 if(rs.getString(1).equals(userPassword))
					 return 1;  // 로그인 성공
				 else
					 return 0;  // 비밀번호 불일치
			 }
			 return -1;  // 아이디가 없음
	   
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -2; // 데이터 베이스 오류
	
	 }
	 
	 //회원가입 
	 public int join(User user) {
		 String SQL = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)"; 
		 try {
			 pstmt = conn.prepareStatement(SQL); 
			 pstmt.setString(1,  user.getUserID());
			 pstmt.setString(2,  user.getUserPassword());
			 pstmt.setString(3,  user.getUserName());
			 pstmt.setString(4,  user.getUserGender());
			 pstmt.setString(5,  user.getUserEmail());
			 return pstmt.executeUpdate(); 
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
		 return -1 ; //데이터베이스 오류 
	 }
	 
	 //회원정보 불러오기
	 public User getUser(String userID) {
			String SQL = "SELECT * FROM USER WHERE userID = ?"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  userID);
				rs = pstmt.executeQuery(); 
				if(rs.next()) {
					User user = new User(); 
					user.setUserID(rs.getString(1)); 
					user.setUserPassword(rs.getString(2)); 
					user.setUserName(rs.getString(3)); 
					user.setUserGender(rs.getString(4)); 
					user.setUserEmail(rs.getString(5)); 
					return user; 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null ; 
		}
	 
	 //회원정보 수정
	 public int updateInfo(String userID, String userPassword, String userName, String userGender , String userEmail) {
			String SQL = "UPDATE USER SET userPassword = ?, userName = ?, userGender = ?, userEmail = ? WHERE userID = ?"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  userPassword);
				pstmt.setString(2,  userName);
				pstmt.setString(3,  userGender);
				pstmt.setString(4, userEmail);
				pstmt.setString(5, userID);
				return pstmt.executeUpdate(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류 
	 }
	 
	 //회원 탈퇴
	 public int deleteAccount(String userID, String userPassword) {
			String SQL1 = "SELECT userPassword FROM USER WHERE userID = ?";
			String SQL2 = "DELETE FROM USER WHERE userID = ?"; 
			String pw = ""; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL1);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					pw = rs.getString("userPassword"); 
					if (pw.equals(userPassword)) {
						pstmt = conn.prepareStatement(SQL2); 
						pstmt.setString(1,  userID);
						return pstmt.executeUpdate();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류 
	 }
}
