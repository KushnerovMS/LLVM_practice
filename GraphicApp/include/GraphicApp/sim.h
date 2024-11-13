#ifndef _SIM_H_
#define _SIM_H_

#define SIM_X_SIZE 1024
#define SIM_Y_SIZE 512

#define SIM_CELL_SIZE 16

void simFlush();
void simPutPixel(int x, int y, int argb);
void simPutCell(int x, int y, int argb);
int simRand();

void simInit();
void app();
void simExit();

#endif /* _SIM_H_ */
