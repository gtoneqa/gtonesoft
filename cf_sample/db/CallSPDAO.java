/*
 * Created on 2005. 5. 17.
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import basic.User;

/**
 * @author Administrator
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class CallSPDAO implements IDAO {

	public static String JDBC_URL = basic.Constants.CN_JDBC_URL;

	public static String JDBC_USER = basic.Constants.CN_JDBC_USER;

	public static String JDBC_PASSWORD = basic.Constants.CN_JDBC_PASSWORD;
	
	private static final String callQry = "{call PR_TOUCH_USER(?)}";

	private static final String viewQry = 
		"SELECT ID, NAME, ENCODED_PWD, FN_DECODE(ENCODED_PWD) PASSWORD "
				+ " FROM CURRENT_USER_VIEW ";
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(JDBC_URL, JDBC_USER,
					JDBC_PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * get User List
	 * 
	 * @return User List
	 */
	public List getUserbyView() {
		List retList = new ArrayList();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(viewQry);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				User user = new User();
				user.setId(rset.getInt("ID"));
				user.setName(rset.getString("NAME"));
				user.setPassword(rset.getString("PASSWORD"));
				retList.add(user);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return retList;

	}

	/**
	 * get User List
	 * 
	 * @return User List
	 */
	public boolean callSP() {
		boolean retBool = false;
		Connection con = null;
		CallableStatement cstmt = null;

		try {
			con = getConnection();
			cstmt = con.prepareCall(callQry);
			cstmt.setInt(1, 1);
			int retVal = cstmt.executeUpdate();
			if (retVal>0) retBool = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (cstmt != null) {
				try {
					cstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return retBool;

	}
	
	public static void main(String[] args) {
		List list = new ArrayList();
		
		CallSPDAO spDAO = new CallSPDAO();
		list.add(spDAO);
		
		if (list.get(0) instanceof CallSPDAO) {
			System.out.println(((CallSPDAO)list.get(0)).callSP());
		}
		System.out.println(spDAO.getUserbyView());
	}
}
