#include <stdio.h>
#include <string.h>

int main() {
    char res[20][10], arg1[20][10], op[20][5], arg2[20][10];
    char R[20][10], A1[20][10], O[20][5], A2[20][10];

    int n, i, j, k = 0, found;

    printf("Enter number of statements: ");
    scanf("%d", &n);

    printf("Enter statements (res arg1 op arg2):\n");
    for (i = 0; i < n; i++)
        scanf("%s %s %s %s", res[i], arg1[i], op[i], arg2[i]);

    for (i = 0; i < n; i++) {
        found = 0;

        for (j = 0; j < k; j++) {
            if (strcmp(arg1[i], A1[j]) == 0 &&
                strcmp(op[i], O[j]) == 0 &&
                strcmp(arg2[i], A2[j]) == 0) {

                printf("Eliminated: %s = %s %s %s (same as %s)\n",
                       res[i], arg1[i], op[i], arg2[i], R[j]);
                found = 1;
                break;
            }
        }

        if (!found) {
            strcpy(R[k], res[i]);
            strcpy(A1[k], arg1[i]);
            strcpy(O[k], op[i]);
            strcpy(A2[k], arg2[i]);
            k++;
        }
    }

    printf("\nOptimized Code:\n");
    for (i = 0; i < k; i++)
        printf("%s = %s %s %s\n", R[i], A1[i], O[i], A2[i]);

    return 0;
}
