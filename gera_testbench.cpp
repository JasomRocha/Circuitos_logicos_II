#include <stdio.h>

int main() {
    FILE *arquivo;
    arquivo = fopen("circuito_equacao.tv", "w");

    if (arquivo == NULL) {
        printf("Erro ao abrir o arquivo de teste.\n");
        return 1;
    }

    int X;
    for (X = 0; X <= 9; X++) {
        int Z;

        if (X > 6) {
            Z = 2 * X + 5;
        } else {
            Z = X * X + 10 * X;
        }

        fprintf(arquivo, "%d%d%d%d_%d%d%d%d%d%d%d\n",
                (X >> 3) & 1, (X >> 2) & 1, (X >> 1) & 1, X & 1,
                (Z >> 7) & 1, (Z >> 6) & 1, (Z >> 5) & 1, (Z >> 4) & 1,
                (Z >> 3) & 1, (Z >> 2) & 1, (Z >> 1) & 1, Z & 1);
    }

    fclose(arquivo);
    printf("Vetores de teste gerados com sucesso.\n");

    return 0;
}
