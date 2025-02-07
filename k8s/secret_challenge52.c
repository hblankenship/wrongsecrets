#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define SECRET_SIZE 32 // taille arbitraire

char secret[SECRET_SIZE];

void generate_secret() {
    strncpy(secret, "K8S_DEBUG_SECRET", SECRET_SIZE - 1); // copie en mémoire
    secret[SECRET_SIZE - 1] = '\0'; //caractère de fin de chaine
}

void handle_request() {
    printf("Le secret est : %s\n", secret);
    sleep(5);  // Simulation d'une attente avant la prochaine requête
}

int main() {
    generate_secret();
    printf("PID: %d\n", getpid());

    while (1) {
        handle_request();
    }

    return 0;
}
