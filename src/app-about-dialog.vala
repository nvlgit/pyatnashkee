/* app-about-dialog.vala *
 *
 * Copyright (C) 2018 Nick *
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

namespace Pyatnashkee {

	public void show_about() {

		var about = new Gtk.AboutDialog();

		about.logo_icon_name = "com.gitlab.nvlgit.pyatnashkee";
		about.program_name = _("15-puzzle");

		about.version = VERSION;
		about.comments = _("A classic 15-puzzle game");
		about.website = "https://gitlab.com/nvlgit/pyatnashkee";
		about.website_label = null;
		about.copyright = "Copyright © 2018 Nick";

		about.artists = null;
		about.authors = {"Nick", ""};
		about.documenters = null;
		about.translator_credits = null;

		about.license = "GNU Public Licence version 3";
		about.wrap_license = true;

		about.show();
	}
}

