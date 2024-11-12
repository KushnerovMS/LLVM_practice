#include "sim.h"
#include <stdio.h>

#define CELL_TYPE_COUNT 5
#define CELL_TYPE_MAX (CELL_TYPE_COUNT - 1)

#define GRID_WIDTH (SIM_X_SIZE / SIM_CELL_SIZE)
#define GRID_HEIGHT (SIM_Y_SIZE / SIM_CELL_SIZE)

void app() {
	const unsigned int flame_random_dt = 5;
	const unsigned int bonfire_padding = 4;
	const unsigned int cell_colors[CELL_TYPE_COUNT] = {
		0x00000000,
		0xffe52525,
		0xfffaba22,
		0xffffff45,
		0xffffffc9,
	};
	const unsigned int cell_live_power[CELL_TYPE_COUNT] = 	{0, 2, 6, 8, 10};
	const unsigned int cell_create_power[CELL_TYPE_COUNT] = {0, 1, 2, 1, 1};

#define MAKE_CELL(TYPE, POWER) ((((POWER)&0xffu))|(((TYPE)&0xffu)<<8u))

#define CELL_TYPE(CELL) (((CELL)>>8u)&0xffu)
#define CELL_POWER(CELL) ((CELL)&0xffu)

#define CELL_DECR_POWER(CELL) ((((CELL)&0xffu)-1)|((CELL)&~0xffu))

	unsigned int grid[2][GRID_WIDTH][GRID_HEIGHT] = {};
	unsigned int layer = 1;

	grid[layer][GRID_WIDTH / 2][GRID_HEIGHT-1] = MAKE_CELL(4, cell_live_power[4]);
//	grid[layer][GRID_WIDTH / 2+1][GRID_HEIGHT-1] = MAKE_CELL(4, cell_live_power[4]);

	unsigned int buf[6] = {
		0,1,2,3,4,5
	};
	unsigned int *rel_buf[2] = {buf+1, buf+4};
	printf("[%u][%u][%u]\n[%u][%u][%u]\n",
			rel_buf[0][-1], rel_buf[0][0], rel_buf[0][1],
			rel_buf[1][-1], rel_buf[1][0], rel_buf[1][1]);

	while (1) {
		for (unsigned int x = 0; x < GRID_WIDTH; ++x) {
			for (unsigned int y = 0; y < GRID_HEIGHT; ++y) {
				/* [ ][x][ ]   x <- current cell
				 * [ ][ ][ ]
				 */

				unsigned int neighbors_types[6] = {};
				unsigned int neighbors_powers[6] = {};
				if (x>0) {
					neighbors_types[0] = CELL_TYPE(grid[layer][x-1][y]);
					neighbors_powers[0] = CELL_POWER(grid[layer][x-1][y]);
				}
				neighbors_types[1] = CELL_TYPE(grid[layer][x][y]);
				neighbors_powers[1] = CELL_POWER(grid[layer][x][y]);
				if (x<GRID_WIDTH-1) {
					neighbors_types[2] = CELL_TYPE(grid[layer][x+1][y]);
					neighbors_powers[2] = CELL_POWER(grid[layer][x+1][y]);
				}
				if (y<GRID_HEIGHT-1) {
					if (x>0) {
						neighbors_types[3] = CELL_TYPE(grid[layer][x-1][y+1]);
						neighbors_powers[3] = CELL_POWER(grid[layer][x-1][y+1]);
					}
					neighbors_types[4] = CELL_TYPE(grid[layer][x][y+1]);
					neighbors_powers[4] = CELL_POWER(grid[layer][x][y+1]);
					if (x<GRID_WIDTH-1) {
						neighbors_types[5] = CELL_TYPE(grid[layer][x+1][y+1]);
						neighbors_powers[5] = CELL_POWER(grid[layer][x+1][y+1]);
					}
				}

				unsigned int max_type = neighbors_types[0];
				for (unsigned i = 1; i < 6; ++i) {
					if (neighbors_types[i] > max_type)
						max_type = neighbors_types[i];
				}

				unsigned int *rel_type[2] = {neighbors_types+1, neighbors_types+4};
				unsigned int *rel_power[2] = {neighbors_powers+1, neighbors_powers+4};
				
				if(max_type > 0) {
					if (rel_type[0][0] == max_type && rel_power[0][0] > 0) {
						grid[~layer%2][x][y] = MAKE_CELL(rel_type[0][0], rel_power[0][0]-1);
					} else {
						unsigned int power = 0;

						if (rel_type[0][-1] == max_type) power += 2u*rel_power[1][-1];
						if (rel_type[0][1] == max_type) power += 2u*rel_power[1][1];
						if (rel_type[1][0] == max_type) power += 5u*rel_power[1][0];
						if (rel_type[1][-1] == max_type) power += 3u*rel_power[1][-1];
						if (rel_type[1][1] == max_type) power += 3u*rel_power[1][1];
						power /= 15u;
						if (power > 0) power -= 1u;

						if (power < cell_create_power[max_type]) {
							grid[~layer%2][x][y] = MAKE_CELL(max_type-1, power + cell_live_power[max_type-1]);
						} else {
							grid[~layer%2][x][y] = MAKE_CELL(max_type, power - cell_create_power[max_type]);
						}
					}
				} else {
					grid[~layer%2][x][y] = 0;
				}

				simPutCell(x, y, cell_colors[CELL_TYPE(grid[~layer%2][x][y])]);
			}
		}
		layer = ~layer%2;
		simFlush();
	}
} 
