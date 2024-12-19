/*
 * SPDX-FileCopyrigthText: 2021 elementary, Inc. (https://elementary.io)
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

[DBus (name = "org.freedesktop.impl.portal.AppChooser")]
public class AppChooser.Portal : Object {
	private DBusConnection connection;

	public Portal (DBusConnection connection) {
		this.connection = connection;
	}

	public async void choose_application (
		ObjectPath handle,
		string app_id,
		string parent_window,
		string[] choices,
		HashTable<string, Variant> options,
		out uint response,
		out HashTable<string, Variant> results
	) throws DBusError, IOError {
		string res_app_id = "";
		var _results = new HashTable<string, Variant> (str_hash, str_equal);

		string content_type = "";
		if ("content_type" in options && options["content_type"].is_of_type (VariantType.STRING)) {
			content_type = options["content_type"].get_string ();
		}

		// If content_type is provided, spawn xdg-mime to get the default app for it.
		// If that succeeds, check if it's one of the choices and set it as the result app id.
		if (content_type != "") {
			try {
				string? stdout = null;
				Process.spawn_command_line_sync (@"xdg-mime query default $content_type", out stdout, null, null);
				if (stdout != null) {
					string clean_mime_out = stdout.replace (".desktop", "").strip ();
					if (clean_mime_out != "" && clean_mime_out in choices) res_app_id = clean_mime_out;
				}
			} catch {}
		}

		// Else if last_choice is available, set it to that
		if (res_app_id == "" && "last_choice" in options && options["last_choice"].is_of_type (VariantType.STRING)) {
			string last_choice = options["last_choice"].get_string ();
			if (last_choice != "" && last_choice in choices) res_app_id = last_choice;
		}

		// Else set it to the first choice
		if (res_app_id == "" && choices.length > 0) {
			res_app_id = choices[0];
		}

		_results["choice"] = res_app_id;
		results = _results;
		response = res_app_id == "" ? 1 : 0;
	}
}
