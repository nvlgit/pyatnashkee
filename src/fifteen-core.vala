/* logic.vala
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

namespace Fifteen {

	public class Core {

		public int[,] arr;

		/*======================================================*/
		public Core () {
			arr = new int[4,4];
		}
		/*======================================================*/
		public int[,] mixing ( int[,] a ) {

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
		public bool can_be_solved ( int[,] a ) {

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
			/*} else if ( (pos_y % 2 != 0) && (inv_count % 2 == 0) ) {
				stdout.printf ("solvable\n");
				return true; */
			} else {
				stdout.printf ("not solvable\n");
				return false;
			}
		}
		/*======================================================*/
		public bool is_solved (int[,] a) {

			int[,] win_order = {{ 1,  2,  3,  4},
			                    { 5,  6,  7,  8},
			                    { 9, 10, 11, 12},
			                    {13, 14, 15,  0}};
			arr_print(a);

			for (int y = 0; y < 4; y++) {
				for (int x = 0; x < 4; x++) {
					if (a[y,x] != win_order[x,y]) return false;
				}
			}
			return true;
		}
		/*======================================================*/
		public void arr_print (int[,] a) {

			stdout.printf ("\n==============\n");

			for (int y = 0; y < 4; y++) {
				for (int x = 0; x < 4; x++) {
					if (a[x,y] < 10) { print (" "); }
					stdout.printf ("%d  ", a[x,y]);
					if (x > 2) { print ("\n"); }
				}
			}
			stdout.printf ("==============\n");
		}
		/*=========================================*/
	} // end Class Logic
} // end namespace Fifteen
