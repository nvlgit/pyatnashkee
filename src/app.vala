
/* app.vala
 *
 * Copyright (C) 2017 Nick
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using Gtk;

namespace Pyatnashkee {

	public class Application : Gtk.Application {

		/* The application actions */
		private const GLib.ActionEntry[] actions = {

			{"about", about_cb},
			{ "quit", quit_cb }
		};

		public ApplicationWindow window;

		public Application () {

		application_id = "com.gitlab.nvlgit.pyatnashkee";
	}

		public override void startup () {

			base.startup ();
			var css_provider = new Gtk.CssProvider ();
			css_provider.load_from_resource ("/com/gitlab/nvlgit/pyatnashkee/style.css");
			Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (),
			                                          css_provider,
			                                          STYLE_PROVIDER_PRIORITY_APPLICATION);
			add_action_entries (actions, this);
			var builder = new Gtk.Builder.from_resource ("/com/gitlab/nvlgit/pyatnashkee/app-menu.ui");
			var appmenu = (GLib.MenuModel) builder.get_object ("app-menu");
			this.set_app_menu (appmenu);
		}

		public override void activate () {

			var window = new ApplicationWindow (this);
			window.new_game();
			window.present ();
		}

		private void about_cb (SimpleAction action, Variant? parameter) {

			AppAbout about = new AppAbout (get_active_window () );
			about.present ();
		}

		private void quit_cb (SimpleAction action, Variant? parameter) {

			this.quit ();
		}
	}
}
