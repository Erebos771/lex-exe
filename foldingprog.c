#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {
    char r[10][10], a1[10][10], o[10][5], a2[10][10];
    char name[10][10], val[10][10];
    int n, i, j, k = 0;

    printf("Enter number of statements: ");
    scanf("%d", &n);

    printf("Enter statements (res op arg1 arg2):\n");
    for (i = 0; i < n; i++)
        scanf("%s %s %s %s", r[i], o[i], a1[i], a2[i]);

    for (i = 0; i < n; i++) {

        /* Constant Propagation */
        for (j = 0; j < k; j++) {
            if (!strcmp(a1[i], name[j])) strcpy(a1[i], val[j]);
            if (!strcmp(a2[i], name[j])) strcpy(a2[i], val[j]);
        }

        /* Constant Folding */
        if (a1[i][0] >= '0' && a1[i][0] <= '9' &&
            a2[i][0] >= '0' && a2[i][0] <= '9') {

            int x = atoi(a1[i]), y = atoi(a2[i]), z = 0;

            if (!strcmp(o[i], "+")) z = x + y;
            if (!strcmp(o[i], "-")) z = x - y;
            if (!strcmp(o[i], "*")) z = x * y;
            if (!strcmp(o[i], "/")) z = x / y;

            printf("Folded: %s = %d\n", r[i], z);

            sprintf(val[k], "%d", z);
            strcpy(name[k++], r[i]);

            strcpy(o[i], "=");
            sprintf(a1[i], "%d", z);
        }
    }

    printf("\nOptimized Code:\n");
    for (i = 0; i < n; i++) {
        if (!strcmp(o[i], "="))
            printf("%s = %s\n", r[i], a1[i]);
        else
            printf("%s = %s %s %s\n", r[i], a1[i], o[i], a2[i]);
    }

    return 0;
}
