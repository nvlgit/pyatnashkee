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

[CCode(cname="VERSION")] extern const string VERSION;
[CCode(cname="GETTEXT_PACKAGE")] extern const string GETTEXT_PACKAGE;
[CCode(cname="LOCALEDIR")] extern const string LOCALEDIR;

int main (string[] args) {

	Intl.setlocale (LocaleCategory.ALL, "");
	Intl.bindtextdomain (GETTEXT_PACKAGE, LOCALEDIR);
	Intl.bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
	Intl.textdomain (GETTEXT_PACKAGE);

	var app = new Pyatnashkee.Application ();
	return app.run (args);
}
