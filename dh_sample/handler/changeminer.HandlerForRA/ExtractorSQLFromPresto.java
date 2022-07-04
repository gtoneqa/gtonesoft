/**
 * 
 */
package changeminer.HandlerForRA;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.xml.serialize.OutputFormat;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.itplus.cm.parser.common.CMParserCommonData;
import com.itplus.cm.ce.addon.common.custom.HandlerForRA;
import com.itplus.cm.ce.internal.data.DataForAnalyzer;
import com.itplus.cm.ce.internal.meta.CM_OBJ;
import com.itplus.cm.ce.internal.meta.CM_SRC;

import extractor.common.tobj.TDpd;
import extractor.common.tobj.TLocation;
import extractor.common.tobj.TObj;
import extractor.common.tobj.TResult;

/**
 * 
 */
public class ExtractorSQLFromPresto extends HandlerForRA
{
	
	

    public ExtractorSQLFromPresto() {

    }

   /**
	* 
	**/ 
    public String getName() {
        return this.getClass().getName();
    }
    
    /**
    **/ 
    public int doAnalyzeStep(CMParserCommonData data, CM_SRC cm_src, TResult tresult) throws Exception {
        return RETURN_CONTINUE;
    }

   /**
	**/
    public int addAnalyzeStep(CMParserCommonData data, CM_SRC cm_src, TResult tresult) throws Exception {
    	TObj root_obj = tresult.getTObjList()[0];
    	String nodename = cm_src.getSNAME();
   		doSql(root_obj.getName(),cm_src.getSNAME(), root_obj);
        return RETURN_CONTINUE;
    }
    private String conv_data(String sql) {
    	while(true) {
	    	int idx1 = sql.indexOf("%(");
	    	if( idx1 == -1)
	    		return sql;
	    	int idx2 = sql.indexOf(")s",idx1);
	    	if( idx2 == -1)
	    		return sql;
	    	String str1 = sql.substring(0, idx1);
	    	System.out.println("Str1=" + str1);
	    	String str2 = sql.substring(idx2 + ")s".length());
	    	System.out.println("Str2=" + str2);
	    	String str3 = sql.substring(idx1+"%(".length() ,idx2);
	    	System.out.println("Str3=" + str3);
	    	sql = str1 + " :"+ str3+" " + str2;
    	}    	
    }
    
   
    
    private void doSql(String fullname, String fname , TObj root_obj) {
    	FileInputStream fis = null;
		BufferedReader br = null;
		ArrayList filedata = new ArrayList();
	//	TObj sub_obj = new TObj( SQL_NODE_OBJ, fname, fname, 100, new TLocation(1) );
	//	root_obj.add(sub_obj); 
		try {
	    	File file = new File(fullname);
			fis = new FileInputStream(file);
			br = new BufferedReader(new InputStreamReader(fis));
			String line_data = new String();
			StringBuffer sb = new StringBuffer();
			
			while (br.ready()) { 
				line_data = br.readLine();
				if (line_data == null) {
					continue; 
				}
				line_data = conv_data(line_data);
				sb.append(line_data);
				sb.append("\n");				
			}
			TDpd dpd = new TDpd(1009001, sb.toString(), sb.toString(), 100, new TLocation(1));
			//sub_obj.add(dpd);
			root_obj.add(dpd);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (br != null)
					br.close();
				if (fis != null)
					fis.close();
			}
			catch (IOException ex) {
			}
		}   
    }
    
    
   /**
	*
	**/
    public int doTObj(int depth, CM_SRC cm_src, TObj tobj, long parent_object_id) {
        log.trace("HANDLER", depth + " : " + tobj.getName() + " : " + tobj.getTempMap());
        return RETURN_CONTINUE;
    }
  
   /**
	*
	**/
    public int doTDpd(int depth, TDpd tdpd, CM_SRC cm_src, CM_OBJ cm_obj, int seq) throws SQLException {
        log.trace("HANDLER", depth + " : " + tdpd.getName() + " : " + tdpd.getTempMap());
        return RETURN_CONTINUE;
    }

   /**
	*
	**/
    public TResult getTTresult() {
        // TODO Auto-generated method stub
        return null;
    }

   /**
	*
	**/
    public long generateGID(String prefix, TObj tobj) {
        return 0L;
    }

   /**
	*
	**/
    public long generateGID(String prefix, TDpd tdpd) {
        return 0L;
    } 

	/**
	*
	**/
    public String getObjName(boolean is_file, CM_SRC cm_src, String full_object_name)
    {
    	return null;
    }
   
    
    /**
    *
	**/
    public void addAnalyzeStepOnError(CM_SRC cm_src, TResult tresult) {
    }

}
