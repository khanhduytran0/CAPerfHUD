#import "CADebugCommon.h"
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc == 1) {
        // Fast path return value
        return CADebugCommon.perfHUDLevel;
    } else {
        int level = atoi(argv[1]);
        if (level == 10) {
            level = -1;
        }
        CADebugCommon.perfHUDLevel = level;
        return 0; //CADebugCommon.perfHUDLevel != level;
    }
}
