//Modified by dkdksldkfjsldd df sdf tkgkdkddfjsldkjf  ddd kkkk
import java.sql.Connection;
import java.sql.SQLException;

/**/
public class SQL {
	public void main (Connection con) throws SQLException {
		//CRUD_Q �÷��� ?�� ���� 
		String table = "sss from USER_TABLE";
		con.prepareStatement(table);
		
		//DynamicSQLPattern ���� 
		String dynamic = "{call PR_TOUCH_USER(?)}";
		con.prepareStatement(dynamic);
		
	}
}
