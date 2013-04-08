package com.calatrava.plugins.db;

import static android.content.Context.MODE_PRIVATE;
import static android.util.Log.e;
import static android.util.Log.i;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import android.content.Context;

public class InternalStorageDB implements DB {

	private static final String TAG = InternalStorageDB.class.getSimpleName();
	
	private final Context context;
	
	public InternalStorageDB(Context context) {
		this.context = context;
	}

	@Override
	public void store(String key, String value) {
		FileOutputStream store = null;
		try {
			i(TAG, "Storing " + key + " as " + value);
			store = context.openFileOutput(key, MODE_PRIVATE);
			store.write(value.getBytes());
		} catch (IOException e) {
			e(TAG, e.getMessage(), e);
		} finally {
			if (store != null) try { store.close(); } catch (IOException e) {}
		}
	}
	
	@Override
	public String get(String key) {
		FileInputStream store = null;
		try {
			store = context.openFileInput(key);
			ByteArrayOutputStream result = new ByteArrayOutputStream();
			
			int value;
			while ((value = store.read()) != -1)
				result.write(value);

			i(TAG, "Getting " + key + " as " + result.toString());
			return new String(result.toByteArray());
		} catch (IOException e) {
			e(TAG, e.getMessage(), e);
			return null;
		} finally {
			if (store != null) try { store.close(); } catch (IOException e) {}
		}
	}
	
	@Override
	public void remove(String key) {
		i(TAG, "Removing key " + key);
		context.deleteFile(key);
	}
}
