#include <stdio.h>
#include "mycpy.h"

int main() {
    int src[256];
    int len = 0;
    
    while(scanf("%d", src + len) != EOF) {
        len++;
    }

    int dest[256];
    mycpy(dest, src, len*sizeof(int));

    for(int i = 0; i<len; i++) {
        printf("%i ", dest[i]);
    }
    printf("\n");
}
