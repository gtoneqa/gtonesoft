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
public class Json_ini_sql extends HandlerForRA
{
	public final static int JSON_FILE = 821112;
	public final static int PROJECT_NAME_OBJ = 821115;
	public final static int UPPROJECT_OBJ = 821116;
	public final static int OUTPUT_NODE_OBJ = 821117;
	public final static int PROJECT_TYPE_OBJ = 821118;
	public final static int PARAM_KEY_OBJ = 821120;
	
	public final static int TARGET_FILE_DPD = 8211002;
	public final static int OUTPUT_DPD = 8211003;
	public final static int INPUT_DPD = 8211004;
	public final static int CALL_SCRIPT_DPD = 8211005;
	public final static int PARAM_VALUE_DPD = 8211006;
	
	
	public final static int SQL_FILE = 821113;
	public final static int SQL_NODE_OBJ = 821119;
	
	public final static int INI_FILE = 821128;
	public final static int INI_NODE = 821129;
	public final static int INI_NODE_VALUE = 8211020;
	
	// ini, json 에 대한 file node 생성
	public final static int FILE_NODE = 821130;

	
	

    public Json_ini_sql() {

    }

   /**
	*
	**/ 
    public String getName() {
        return this.getClass().getName();
    }
    
    /**
    *  사전 작업에 대한 정의입니다.
    **/ 
    public int doAnalyzeStep(CMParserCommonData data, CM_SRC cm_src, TResult tresult) throws Exception {
        return RETURN_CONTINUE;
    }

   /**
	*  사후 작업에 대한 정의입니다.
	**/
    public int addAnalyzeStep(CMParserCommonData data, CM_SRC cm_src, TResult tresult) throws Exception {
    	TObj root_obj = tresult.getTObjList()[0];
    	String nodename = cm_src.getSNAME();
    	nodename = nodename.substring(0, nodename.indexOf("."));
    	if(cm_src.getSNAME().endsWith(".json")) {
    		TObj sub_obj = new TObj( FILE_NODE, nodename, nodename, 100, new TLocation(1) );
    		root_obj.add(sub_obj); 
    		doJson(root_obj.getName(), sub_obj);
    	}
    	else if(cm_src.getSNAME().endsWith(".ini")) {
    		TObj sub_obj = new TObj( FILE_NODE, nodename, nodename, 100, new TLocation(1) );
    		root_obj.add(sub_obj); 
    		doIni(root_obj.getName(),cm_src.getSNAME(), sub_obj);
    	}    	
    	else if(cm_src.getSNAME().endsWith(".sql")) {
    		doSql(root_obj.getName(),cm_src.getSNAME(), root_obj);
    	}
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
    
    private void doIni(String fullname, String fname , TObj root_obj) {
    	FileInputStream fis = null;
		BufferedReader br = null;

		try {
	    	File file = new File(fullname);
			fis = new FileInputStream(file);
			br = new BufferedReader(new InputStreamReader(fis));
			String line_data = new String();
			StringBuffer sb = new StringBuffer();
			int cnt = 0;
			while (br.ready()) { 
				line_data = br.readLine();
				if (line_data == null) {
					continue; 
				}
				cnt ++;
				if(line_data.indexOf("=") > 0 ) {
					String str[] = line_data.split("=");
					if(str.length == 2) {

						String key = str[0].trim();
						String value = str[1].trim();
						log.debug("key=" +  key, "value = " + value);
						TObj sub_obj = new TObj( INI_NODE, fname + "|" + key, key, 100, new TLocation(cnt) );
						root_obj.add(sub_obj); 
						if(value.length() > 0 ) {
							TDpd dpd = new TDpd(INI_NODE_VALUE, value, value, 100, new TLocation(cnt));
							sub_obj.add(dpd);
						}
					}					
				}
			}
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
    
    private void doSql(String fullname, String fname , TObj root_obj) {
    	FileInputStream fis = null;
		BufferedReader br = null;
		ArrayList filedata = new ArrayList();
		TObj sub_obj = new TObj( SQL_NODE_OBJ, fname, fname, 100, new TLocation(1) );
		root_obj.add(sub_obj); 
		if(!fname.startsWith("presto"))
			return ;
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
			sub_obj.add(dpd);
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
    private void doJson(String fname, TObj root_obj) {
    	JSONParser parser = new JSONParser();
		Object obj;
		try {
			fileConvert(fname);
			obj = parser.parse(new FileReader(fname));
			
			
			// obj = parser.parse(new FileReader("C:/work/My/KDDI/cp-0_1_k_month_auid/cp-0_1_k_month_auid/aa.json"));
			if(obj != null ) {
				if(obj instanceof JSONObject ) {
					System.out.println("obj is JSONObject");
					JSONObject jsonObject = (JSONObject) obj; 	
					JsonSub( jsonObject, root_obj );
				} else if (obj instanceof JSONArray) {
					System.out.println("obj is JSONArray");
					JSONArray jsonArray = (JSONArray) obj; 
					for (int i = 0; i < jsonArray.size(); i ++){  
						JSONObject jsonObject = (JSONObject)jsonArray.get(i);
						System.out.println("index = " + i);
						JsonSub( jsonObject, root_obj );						
					}
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    private void JsonSub(JSONObject jsonObject , TObj root_obj ) {
		String program_type = (String) jsonObject.get("program_type");
		System.out.println("program_type =" + program_type);
		if(program_type == null)
			return ;
		
		TObj type_obj = new TObj( PROJECT_TYPE_OBJ, program_type, program_type, 100, new TLocation(1) );
		root_obj.add(type_obj);	
		
		String program_name = (String) jsonObject.get("program_name");
		System.out.println("program_name =" +program_name);
		if (program_name != null) {
			TObj sub_obj = new TObj( PROJECT_NAME_OBJ, program_name, program_name, 100, new TLocation(1) );
			type_obj.add(sub_obj); 
		} 	
		

		String script = (String) jsonObject.get("script");
		if(script != null) {
			System.out.println("script =" +script);
			int idx1 = script.indexOf(".sql");
			if(idx1 > 0) {
				String str = script.substring(script.lastIndexOf("/")+1, idx1 + ".sql".length());
				TDpd dpd = new TDpd(CALL_SCRIPT_DPD, str, str, 100, new TLocation(1));
				type_obj.add(dpd);
			}
		}
		String target = (String) jsonObject.get("target");
		if(target != null) {
			TDpd target_dpd = new TDpd(TARGET_FILE_DPD, target, target, 100, new TLocation(1));
			type_obj.add(target_dpd);
			System.out.println("target =" +target);
		}
		
		String output = (String) jsonObject.get("output");
		if(output != null) {
			TDpd output_obj = null;
			System.out.println("output =" +output);
			output_obj = new TDpd( OUTPUT_DPD, output, output, 100, new TLocation(1) );
			type_obj.add(output_obj); 
		}
		String input = (String) jsonObject.get("input");
		if(input != null) {
			TDpd input_dpd = new TDpd(INPUT_DPD, input, input, 100, new TLocation(1));
			type_obj.add(input_dpd);
			System.out.println("input =" +input);
		}			

		
/*		JSONArray params = (JSONArray) jsonObject.get("parameter");
		Iterator<String> it = params.iterator();
		while (it.hasNext()) {
			String key = it.next();
			String value = (String) jsonObject.get(key);
			System.out.println("parameter key = " + key+" = "+ value);
		}*/
		JSONObject params = (JSONObject) jsonObject.get("parameter");
		if(params != null) {
		
			Iterator<String> it = params.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				String value = (String) params.get(key);
				System.out.println("parameter key = " + key+" = "+ value);
				TObj param_key = new TObj( PARAM_KEY_OBJ, key, key, 100, new TLocation(1) );
				type_obj.add(param_key);  
				TDpd param_value = new TDpd(PARAM_VALUE_DPD, value, value, 100, new TLocation(1));
				param_key.add(param_value);
				
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
    public void fileConvert(String fname) throws Exception {
    	File inputFile = new File(fname);
    	File outFile = new File(fname+".new");
    	FileInputStream fileinoutStream = null;
    	BufferedReader bufferReader = null;
    	FileOutputStream fileOutputStream = null;
    	BufferedWriter bufferWriter = null;
    	boolean result= false;
    	try { 
    		fileinoutStream = new FileInputStream(inputFile);
    		fileOutputStream = new FileOutputStream(outFile);
    		bufferReader = new BufferedReader(new InputStreamReader(fileinoutStream));
    		bufferWriter = new BufferedWriter(new OutputStreamWriter(fileOutputStream));
    		String line;
    		while((line= bufferReader.readLine()) != null) {
    			int idx = line.indexOf(": {{overwrite}}");
    			if(idx != -1) {
    				line = line.substring(0,  idx) + ": \"{{overwrite}}\"";
    				result = true;
    			}
    			// System.out.println("line" + line);
    			bufferWriter.write(line, 0, line.length());
    			bufferWriter.newLine();
    		}
    		
    	} finally {
    		try {
    			if (bufferReader != null )
    				bufferReader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		try {
    			if (bufferWriter != null )
    				bufferWriter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		if(result) {
    			inputFile.delete();
    			outFile.renameTo(inputFile);
    		} else {
    			outFile.delete(); 
    		}
    		
    	}
    }
    
    /**
    *
	**/
    public void addAnalyzeStepOnError(CM_SRC cm_src, TResult tresult) {
    }
    public static void main(String[] args) {
    	Json_ini_sql xx = new Json_ini_sql();
    	TObj aa = new TObj(10000, "root", "root", 100, new TLocation());
    	xx.doJson("C:/work/My/KDDI/src/aa.json", aa);
    }
}
