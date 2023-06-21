package com.ml.util;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
//工具类
public class DBUtil {
	//把结果集中的数据转存到List<Map>集合中
	public static List<Map<String, String>> getHashMap(ResultSet rs) throws SQLException {
		List<Map<String, String>> dataTable = new ArrayList<Map<String, String>>();
		ResultSetMetaData rsmd = rs.getMetaData();
		while (rs.next()) {
			Map<String, String> item = new HashMap<String, String>();
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				putToHash(item, rsmd.getColumnLabel(i).toLowerCase(), rs.getString(i));
			}
			dataTable.add(item);
		}
		return dataTable;
	}
	private static void putToHash(Map<String, String> item, String key, String value) {
		//if (value != null) { 
			item.put(key, value);
		//}
	}
}
