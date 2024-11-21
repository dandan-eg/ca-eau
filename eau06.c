#include <stdio.h>
#include <stdbool.h>

int len(const char* s) {
    int i = 0;
    while(s[i]) {
        i++;
    }

    return i;
}

bool is_lower_alpha(char c) {
    return  c >= 'a' && c <= 'z';
}

char to_upper(char lower) {
    lower -= 'a';
    return lower + 'A';
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("usage: ./eau06.o \"string\"");
        return 1;
    }

    char* source = argv[1];
    int length = len(source);

    int i = 0;
    while (i < length) {

        source[i] = to_upper(source[i]);

        i++;
        while (!is_lower_alpha(source[i])) {
            i++;
        }
        i++;
    }

    printf("%s\n", source);
}

