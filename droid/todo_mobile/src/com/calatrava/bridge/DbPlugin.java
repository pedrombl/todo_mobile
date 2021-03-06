package com.calatrava.bridge;

import static com.calatrava.plugins.db.DB.GET_METHOD;
import static com.calatrava.plugins.db.DB.REMOVE_METHOD;
import static com.calatrava.plugins.db.DB.STORE_METHOD;

import static android.util.Log.i;

import java.util.Map;

import android.content.Context;
import android.content.Intent;

import com.calatrava.CalatravaPlugin;
import com.calatrava.plugins.db.DB;
import com.calatrava.plugins.db.InternalStorageDB;

@CalatravaPlugin(name = "db")
public class DbPlugin implements RegisteredPlugin {

	private static final String TAG = DbPlugin.class.getSimpleName();
	
	private static final String METHOD = "method";
	private static final String KEY = "key";
	private static final String VALUE = "value";

	private static final String GET_CALLBACK = "getCallback";
	
	private PluginRegistry registry;
	private Context context;
	private DB store;

	@Override
	public void setContext(PluginRegistry registry, Context ctxt) {
		this.registry = registry;
		this.context = ctxt;
		this.store = new InternalStorageDB(context);
		initializePlugin();
	}

	private void initializePlugin() {
		registry.installCommand("db", new PluginCommand() { @Override public void execute(Intent action, RegisteredActivity frontmost) {
			String method = (String) action.getExtras().get(METHOD);
			String key = (String) action.getExtras().get(KEY);

			i(TAG, "Calling plugin method " + method + " for key " + key);
			
			if (REMOVE_METHOD.equals(method)) store.remove(key);

			if (GET_METHOD.equals(method)) {
				String value = store.get(key);
				String callback = (String) action.getExtras().get(GET_CALLBACK);
				DbPlugin.this.registry.invokeCallback(callback, value);
			}
			
			if (STORE_METHOD.equals(method)) {
				String value = (String) action.getExtras().get(VALUE);
				store.store(key, value);
			}
		}});
	}

	@Override
	public void call(String method, Map<String, Object> args) {
		Intent call = registry.pluginCommand("db");
		call.putExtra(METHOD, method);
		call.putExtra(KEY, args.get(KEY).toString());

		Object value = args.get(VALUE);
		if (value != null) call.putExtra(VALUE, value.toString());

		Object getCallback = args.get(GET_CALLBACK);
		if (getCallback != null) call.putExtra(GET_CALLBACK, getCallback.toString());
		
		context.sendBroadcast(call);
	}

}
