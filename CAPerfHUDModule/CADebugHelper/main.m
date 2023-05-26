#import "CADebugCommon.h"
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc == 2) {
        int level = atoi(argv[1]);
        if (level == 10) {
            level = -1;
        }
        CADebugCommon.perfHUDLevel = level;
    }
    // Fast path return value
    return CADebugCommon.perfHUDLevel;
}
