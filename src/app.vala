/* -*- Mode: C; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-  */
/*
 * main.c
 * Copyright (C) 2017 Nick <nick@lee>
 * 
 * Pyatnashkee is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * Pyatnashkee is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using Gtk;

namespace Pyatnashkee {

    public class Application : Gtk.Application {

        public ApplicationWindow window;

        public Application () {
            application_id = "com.github.nvlgit.pyatnashkee";
        }

		public override void startup () {

			base.startup ();
			var css_provider = new Gtk.CssProvider ();
       		css_provider.load_from_resource ("/com/github/nvlgit/pyatnashkee/tiles.css");
       		Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (),
            						  css_provider,
							  STYLE_PROVIDER_PRIORITY_APPLICATION);
			var action = new GLib.SimpleAction ("quit", null);
            action.activate.connect (quit);
            add_action (action);
			string[] accels = { "<Ctrl>Q" };
			set_accels_for_action ("app.quit", accels);

			
		}	

        public override void activate () {

			var window = new ApplicationWindow (this);
			/*var geometry = Gdk.Geometry();
			geometry.min_aspect = 0.88;
			geometry.max_aspect = 0.88;
			window.set_geometry_hints (window, geometry, Gdk.WindowHints.ASPECT);*/
			window.new_game();
            window.present ();
        }


    }




    public static int main (string[] args) {

        var application = new Application ();


		return application.run (args);
    }
}
