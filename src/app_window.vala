/* app_window.vala
 *
 * Copyright (C) 2018 Nick
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

	[GtkTemplate (ui = "/com/gitlab/nvlgit/pyatnashkee/window.ui")]
	public class ApplicationWindow : Gtk.ApplicationWindow {

		[GtkChild]
		private Gtk.Button button_0_0;  // buttons_x_y
		[GtkChild]                      //┌─────┬─────┬─────┬─────┐
		private Gtk.Button button_1_0;  //│ 0,0 │ 1,0 │ 2,0 │ 3,0 │
		[GtkChild]                      //├─────┼─────┼─────┼─────┤
		private Gtk.Button button_2_0;  //│ 0,1 │ 1,1 │ 2,1 │ 3,1 │
		[GtkChild]                      //├─────┼─────┼─────┼─────┤
		private Gtk.Button button_3_0;  //│ 0,2 │ 1,2 │ 2,2 │ 3,2 │
		[GtkChild]                      //├─────┼─────┼─────┼─────┤
		private Gtk.Button button_0_1;  //│ 0,3 │ 1,3 │ 2,3 │ 3,3 │
		[GtkChild]                      //└─────┴─────┴─────┴─────┘
		private Gtk.Button button_1_1;
		[GtkChild]
		private Gtk.Button button_2_1;
		[GtkChild]
		private Gtk.Button button_3_1;
		[GtkChild]
		private Gtk.Button button_0_2;
		[GtkChild]
		private Gtk.Button button_1_2;
		[GtkChild]
		private Gtk.Button button_2_2;
		[GtkChild]
		private Gtk.Button button_3_2;
		[GtkChild]
		private Gtk.Button button_0_3;
		[GtkChild]
		private Gtk.Button button_1_3;
		[GtkChild]
		private Gtk.Button button_2_3;
		[GtkChild]
		private Gtk.Button button_3_3;

		private Gtk.Button[,] ba;

		[GtkChild]
		public Gtk.Button reload;
		[GtkChild]
		private Gtk.Revealer info_revealer;
		[GtkChild]
		private Gtk.Grid info_grid;

		/*======================================================*/
		[GtkCallback]
		private void button_0_0_clicked_handler () { tile_clicked (0, 0); }
		[GtkCallback]
		private void button_1_0_clicked_handler () { tile_clicked (1, 0); }
		[GtkCallback]
		private void button_2_0_clicked_handler () { tile_clicked (2, 0); }
		[GtkCallback]
		private void button_3_0_clicked_handler () { tile_clicked (3, 0); }
		[GtkCallback]
		private void button_0_1_clicked_handler () { tile_clicked (0, 1); }
		[GtkCallback]
		private void button_1_1_clicked_handler () { tile_clicked (1, 1); }
		[GtkCallback]
		private void button_2_1_clicked_handler () { tile_clicked (2, 1); }
		[GtkCallback]
		private void button_3_1_clicked_handler () { tile_clicked (3, 1); }
		[GtkCallback]
		private void button_0_2_clicked_handler () { tile_clicked (0, 2); }
		[GtkCallback]
		private void button_1_2_clicked_handler () { tile_clicked (1, 2); }
		[GtkCallback]
		private void button_2_2_clicked_handler () { tile_clicked (2, 2); }
		[GtkCallback]
		private void button_3_2_clicked_handler () { tile_clicked (3, 2); }
		[GtkCallback]
		private void button_0_3_clicked_handler() { tile_clicked (0, 3); }
		[GtkCallback]
		private void button_1_3_clicked_handler() { tile_clicked (1, 3); }
		[GtkCallback]
		private void button_2_3_clicked_handler() { tile_clicked (2, 3); }
		[GtkCallback]
		private void button_3_3_clicked_handler() { tile_clicked (3, 3); }
		[GtkCallback]
		private void new_game_clicked_handler() { new_game(); }

		private Fifteen.Core puzzle;
		/*======================================================*/
		public ApplicationWindow (Gtk.Application application) {
			GLib.Object (application: application);

			ba = {{button_0_0, button_1_0, button_2_0, button_3_0},
			      {button_0_1, button_1_1, button_2_1, button_3_1},
			      {button_0_2, button_1_2, button_2_2, button_3_2},
			      {button_0_3, button_1_3, button_2_3, button_3_3}};

			puzzle = new Fifteen.Core();
			info_revealer.notify["child-revealed"].connect (info_revealed_cb);
			info_grid.visible = false;
		}
		/*======================================================*/
		private void show_infobar (bool show) {


			if (show) {
				info_grid.visible = true;
				info_revealer.set_reveal_child (true); //!
		} else {
				info_revealer.set_reveal_child (false);
			}
		}
		/*======================================================*/
		private void info_revealed_cb () {

			if (!info_revealer.reveal_child) {
				info_grid.visible = false;
			}
				redraw_tiles(puzzle.arr);
		}
		/*======================================================*/
		public void new_game () {

			do {
				puzzle.arr = puzzle.mixing(puzzle.arr);
			} while ( puzzle.is_solved(puzzle.arr) );

			if (!info_revealer.reveal_child) {
				redraw_tiles(puzzle.arr);
			}

			show_infobar(false);
		}
		/*======================================================*/
		private void tile_clicked (int x, int y) {
			
			if ( !puzzle.is_solved(puzzle.arr) ) {

				int zero_x = 0, zero_y = 0;

				for (int tmp_y = 0; tmp_y < 4; tmp_y++) { // finding for coordinates of zero
					for (int tmp_x = 0; tmp_x < 4; tmp_x++) {
						if ( puzzle.arr[tmp_y,tmp_x] == 0 ) {
							zero_x = tmp_x;
							zero_y = tmp_y;
						}
					}
				}

				if (zero_x == x) { //If click-tile on one line with zero on the x axis
					if (zero_y < y) { // then shift
						for (int t = zero_y; t < y; t++) {
							puzzle.arr[t,x] = puzzle.arr[(t+1),x];
							puzzle.arr[(t+1),x] = 0;
						}
					} else { // zero_y > y
						for (int t = zero_y; t > y; t--) {
							puzzle.arr[t,x] = puzzle.arr[(t-1),x];
							puzzle.arr[(t-1),x] = 0;
						}
					}
				}

				if (zero_y == y) { //If click-tile on one line with zero on the y axis
					if (zero_x < x) { // then shift
						for (int t = zero_x; t < x; t++) {
							puzzle.arr[y,t] = puzzle.arr[y,(t+1)];
							puzzle.arr[y,(t+1)] = 0;
						}
					} else { // zero_x > x
						for (int t = zero_x; t > x; t--) {
							puzzle.arr[y,t] = puzzle.arr[y,(t-1)];
							puzzle.arr[y,(t-1)] = 0;
						}
					}
				}

			}

			redraw_tiles(puzzle.arr);

			if (puzzle.is_solved(puzzle.arr) ) {
				show_infobar(true);
			}
		}
		/*======================================================*/
		private void redraw_tiles(int[,] a) {

			for (int y = 0; y < 4; y++) {
				for (int x = 0; x < 4; x++) {

					ba[y,x].label = a[y,x].to_string();
					if ( a[y,x] == 0 ) {
						ba[y,x].visible = false;
					} else {
						ba[y,x].visible = true;
					}
				}
			}
		}
		/*======================================================*/
	} // end Class ApplicationWindow
} // end namespace Pyatnashkee
