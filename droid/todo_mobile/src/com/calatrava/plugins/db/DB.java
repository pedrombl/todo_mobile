package com.calatrava.plugins.db;

public interface DB {
	
	static String STORE_METHOD = "store";
	static String GET_METHOD = "get";
	static String REMOVE_METHOD = "remove";

	void store(String key, String value);
	void remove(String key);
	String get(String key);

}