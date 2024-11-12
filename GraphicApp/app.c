#include "sim.h"
#include <stdio.h>

#define CELL_TYPE_COUNT 6
#define CELL_TYPE_MAX (CELL_TYPE_COUNT - 1)

#define GRID_WIDTH (SIM_X_SIZE / SIM_CELL_SIZE)
#define GRID_HEIGHT (SIM_Y_SIZE / SIM_CELL_SIZE)

#define	RAND_MAX	2147483647

void app() {
	const unsigned int flame_random_dt = 5;
	const unsigned int bonfire_padding = 4;
	const unsigned int cell_colors[CELL_TYPE_COUNT] = {
		0x00000000,
		0xff202020,
		0xffe52525,
		0xfffaba22,
		0xffffff45,
		0xffffffc9,
	};
	const unsigned int cell_power_bounds[CELL_TYPE_COUNT] = {0, 5, 15, 50, 100, 200};

	unsigned int grid[2][GRID_WIDTH][GRID_HEIGHT] = {};
	unsigned int layer = 1;

	/* [ ][x][ ]   x <- current cell
	 * [ ][ ][ ]
	 * [ ][ ][ ]
	 */
	const unsigned int neighbors_coefs[9] = {
		4, 3, 4,
		3, 12, 3,
        1, 4, 1
	};
	unsigned int neighbors_coefs_sum = 0;
	for (unsigned int i = 0; i < 9; ++i) {
		neighbors_coefs_sum += neighbors_coefs[i];
	}

	while (1) {
		for (unsigned int x = 0; x < GRID_WIDTH; ++x) {
			if (simRand() > RAND_MAX/100*(100-2*(GRID_WIDTH*GRID_WIDTH/4-(x-GRID_WIDTH/2)*(x-GRID_WIDTH/2))*4/GRID_WIDTH/GRID_WIDTH))  {
				grid[layer][x][GRID_HEIGHT-1] += 10000 + simRand()/(RAND_MAX/10000);
			} else if (simRand() > RAND_MAX/100*(100-80*(GRID_WIDTH*GRID_WIDTH/4-(x-GRID_WIDTH/2)*(x-GRID_WIDTH/2))*4/GRID_WIDTH/GRID_WIDTH)) {
				grid[layer][x][GRID_HEIGHT-1] += 100 + simRand()/(RAND_MAX/100);
			}
			for (unsigned int y = 0; y < GRID_HEIGHT; ++y) {
				unsigned int neighbors[9] = {};
				if (x>0) {
					neighbors[0] = grid[layer][x-1][y];
				}
				neighbors[1] = grid[layer][x][y];
				if (x<GRID_WIDTH-1) {
					neighbors[2] = grid[layer][x+1][y];
				}
				if (y<GRID_HEIGHT-1) {
					if (x>0) {
						neighbors[3] = grid[layer][x-1][y+1];
					}
					neighbors[4] = grid[layer][x][y+1];
					if (x<GRID_WIDTH-1) {
						neighbors[5] = grid[layer][x+1][y+1];
					}
				}
				if (y<GRID_HEIGHT-2) {
					if (x>0) {
						neighbors[3] = grid[layer][x-1][y+2];
					}
					neighbors[4] = grid[layer][x][y+2];
					if (x<GRID_WIDTH-1) {
						neighbors[5] = grid[layer][x+1][y+2];
					}
				}

				unsigned int power = 0;
				for (unsigned int i = 0; i < 9; ++i) {
					power += neighbors[i] * neighbors_coefs[i];
				}
				power /= neighbors_coefs_sum;

				grid[~layer%2][x][y] = power;

				unsigned int type = CELL_TYPE_MAX;
				for (unsigned int i = 0; i < CELL_TYPE_COUNT; ++i) {
					if (power <= cell_power_bounds[i]) {
						type = i;
						break;
					}
				}

				simPutCell(x, y, cell_colors[type]);
			}
		}
		layer = ~layer%2;
		simFlush();
	}
} 
