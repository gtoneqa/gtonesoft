/*
 * Created on 2005. 2. 21.
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package basic;

/**
 * @author LimSungHyun
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class Constants {
	public static String CN_JDBC_URL = "jdbc:oracle:thin:@localhost:1521:SNU92";
	
	public static String CN_JDBC_USER = "scott";

	public static String CN_JDBC_PASSWORD = "tiger";
	
	private static Constants singleton = new Constants();
	public  static Constants getInstance() {return singleton;} //CR5855

}
