/* app_window.vala
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

namespace Pyatnashkee {
	
    [GtkTemplate (ui = "/com/github/nvlgit/pyatnashkee/window.ui")]
    public class ApplicationWindow : Gtk.ApplicationWindow {

        [GtkChild]
        private Gtk.Button button_0_0;  // buttons_x_y
        [GtkChild]                      // |---------------------------|
        private Gtk.Button button_1_0;  // | 0, 0 | 1, 0 | 2, 0 | 3, 0 |
        [GtkChild]                      // |---------------------------|
        private Gtk.Button button_2_0;  // | 0, 1 | 1, 1 | 2, 1 | 3, 1 |
        [GtkChild]                      // |---------------------------|
        private Gtk.Button button_3_0;  // | 0, 2 | 1, 2 | 2, 2 | 3, 2 |
        [GtkChild]                      // |---------------------------|
        private Gtk.Button button_0_1;  // | 0, 3 | 1, 3 | 2, 3 | 3, 3 |
        [GtkChild]                      // |---------------------------|
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
	[GtkChild]
	public Gtk.Button reload;
	[GtkChild]
	private Gtk.InfoBar info_bar;
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
		/*======================================================*/
        public ApplicationWindow (Gtk.Application application) {
            GLib.Object (application: application);
        }
		private int[,] arr = new int[4,4];
		/*======================================================*/
		public void new_game () {

			do { arr = mixing(arr); }
			while ( is_solved(arr) );
			
			redraw_tiles(arr);

			if ( info_bar.visible ) {
				info_bar.visible = false;
				/*
				 this.resize (100,100); don't work properly for InfoBar
				 https://bugzilla.gnome.org/show_bug.cgi?id=710888
				 workaround: reshow_with_initial_size (); 
				 */
				this.reshow_with_initial_size ();
			}
		}
		/*======================================================*/
		private void tile_clicked ( int x, int y ) {
			
		 if ( !is_solved(arr) ) {
			
			
			int zero_x = 0, zero_y = 0;
			
			for (int tmp_y = 0; tmp_y < 4; tmp_y++) { // finding for coordinates of zero
				for (int tmp_x = 0; tmp_x < 4; tmp_x++) {
					if ( arr[tmp_y,tmp_x] == 0 ) {
						zero_x = tmp_x;
						zero_y = tmp_y;
					}
				}
			}

			if (zero_x == x) { //If click-tile on one line with zero on the x axis
				if (zero_y < y) { // then shift
					for (int t = zero_y; t < y; t++) {
						arr[t,x] = arr[(t+1),x];
						arr[(t+1),x] = 0;
					}
				} else { // zero_y > y
					for (int t = zero_y; t > y; t--) {
						arr[t,x] = arr[(t-1),x];
						arr[(t-1),x] = 0;
					}
				}
			}
					
			if (zero_y == y) { //If click-tile on one line with zero on the y axis
				if (zero_x < x) { // then shift
					for (int t = zero_x; t < x; t++) {
						arr[y,t] = arr[y,(t+1)];
						arr[y,(t+1)] = 0;
					}
				} else { // zero_x > x
					for (int t = zero_x; t > x; t--) {
						arr[y,t] = arr[y,(t-1)];
						arr[y,(t-1)] = 0;
					}
				}
			}

		 }

			redraw_tiles(arr);

			if ( ( is_solved(arr) ) && ( !info_bar.visible ) ) {
				//stdout.printf ("Solved!\n ");
				info_bar.visible = true;
			} else {
				info_bar.visible = false;
			}
		}
		/*======================================================*/
		private void redraw_tiles(int[,] a) {

		  for (int y = 0; y < 4; y++) {
			for (int x = 0; x < 4; x++) {
				switch (y) {
				case 0:
						switch (x) {
						case 0:
								button_0_0.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_0_0.visible = false;
								} else {
									button_0_0.visible = true;
								}
								break;
						case 1:
								button_1_0.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_1_0.visible = false;
								} else {
									button_1_0.visible = true;
								}
								break;
						case 2:
								button_2_0.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_2_0.visible = false;
								} else {
									button_2_0.visible = true;
								}
								break;
						case 3:
								button_3_0.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_3_0.visible = false;
								} else {
									button_3_0.visible = true;
								}
								break;
						}
						break;
				case 1:
						switch (x) {
						case 0:
								button_0_1.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_0_1.visible = false;
								} else {
									button_0_1.visible = true;
								}
								break;
						case 1:
								button_1_1.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_1_1.visible = false;
								} else {
									button_1_1.visible = true;
								}
								break;
						case 2:
								button_2_1.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_2_1.visible = false;
								} else {
									button_2_1.visible = true;
								}
								break;
						case 3:
								button_3_1.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_3_1.visible = false;
								} else {
									button_3_1.visible = true;
								}
								break;
						}
						break;
				case 2:
						switch (x) {
						case 0:
								button_0_2.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_0_2.visible = false;
								} else {
									button_0_2.visible = true;
								}
								break;
						case 1:
								button_1_2.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_1_2.visible = false;
								} else {
									button_1_2.visible = true;
								}
								break;
						case 2:
								button_2_2.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_2_2.visible = false;
								} else {
									button_2_2.visible = true;
								}
								break;
						case 3:
								button_3_2.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_3_2.visible = false;
								} else {
									button_3_2.visible = true;
								}
								break;
						}
						break;
				case 3:
						switch (x) {
						case 0:
								button_0_3.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_0_3.visible = false;
								} else {
									button_0_3.visible = true;
								}
								break;
						case 1:
								button_1_3.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_1_3.visible = false;
								} else {
									button_1_3.visible = true;
								}
								break;
						case 2:
								button_2_3.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_2_3.visible = false;
								} else {
									button_2_3.visible = true;
								}
								break;
						case 3:
								button_3_3.label = a[y,x].to_string();
								if ( a[y,x] == 0 ) {
									button_3_3.visible = false;
								} else {
									button_3_3.visible = true;
								}
								break;
						}
						break;
				}  // end switch (y)
			} // end for x
		  }  // end for y
		} // end redraw_tiles()
		/*======================================================*/
		private int[,] mixing ( int[,] a ) {

			int k = 0, l = 0;
			int[] inv = new int[16];

    		    do {
        		for (int i = 0; i < 4; i++) {
            		    for (int j = 0; j < 4; j++) {
                		a[i,j] = 0;
                		inv[i * 4 + j] = 0;
            		    }
        		}
        		for (int i = 1; i < 16; i++) {
            		    do {
                		k = Random.int_range (0, 4);
                		l = Random.int_range (0, 4);
            		    } while (a[k,l] != 0);
            		    a[k, l] = i;
            		    inv[k * 4 + l] = i;
        		}
    		    } while (!can_be_solved(a));
		    return a; //Return mixed array
		}
		/*======================================================*/
		private bool can_be_solved ( int[,] a ) {
	
			int inv_count = 0;
			for(int i = 0; i < 15; i++)	{
    				for(int j = i+1; j < 16; j++) {
        				if ( a[i / 4, i % 4] > a[j / 4, j % 4] ) { inv_count++; }
				}
			}
			int pos_y = 0;
			for (int i = 4 - 1; i >= 0; i--) {
    				for (int j = 4 - 1; j >= 0; j--) {
        				if (a[i,j] == 0) { pos_y = 4 - i; }
				}
			}
			
			int pos_x = 0;
			for (int j = 4 - 1; j >= 0; j--) {
    				for (int i = 4 - 1; i >= 0; i--) {
        				if (a[i,j] == 0) { pos_x = 4 - j; }
				}
			}

			arr_print (arr);
			stdout.printf ("inv_count = %d\n", inv_count);
			stdout.printf ("pos_y = %d\n", pos_y);
			stdout.printf ("pos_x = %d\n", pos_x);

			if ( (pos_y % 2 == 0) && (pos_x % 2 == 0) && (inv_count % 2 != 0) ) {
				stdout.printf ("solvible\n");
				return true;
		/*	} else if ( (pos_y % 2 != 0) && (inv_count % 2 == 0) ) {
				stdout.printf ("solvible\n");
				return true; */
			} else {
				stdout.printf ("not solvible\n");
				return false;
			} 
		}
		/*======================================================*/
		private bool is_solved ( int[,] a ) {

			int[,] win_order = {{ 1,  2,  3,  4}, { 5,  6,  7,  8},
                			    { 9, 10, 11, 12}, {13, 14, 15,  0}};

			for (int y = 0; y < 4; y++) {
				for (int x = 0; x < 4; x++) {
					if (a[y,x] != win_order[y,x]) return false;
				}
			}
			return true;
		}
		/*======================================================*/
		private void arr_print ( int[,] a ) {

			stdout.printf ("==============\n");

			for (int y = 0; y < 4; y++) {
				for (int x = 0; x < 4; x++) {
					if (a[y,x] < 10) { print (" "); }
					stdout.printf ("%d  ", a[y,x]);
					if (x > 2) { print ("\n"); }
				}
			}
			stdout.printf ("==============\n\n");
		}
		/*=========================================*/
	} // end Class ApplicationWindow
} // end namespace Pyatnashkee
