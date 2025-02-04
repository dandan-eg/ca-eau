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
    char position_in_alphabet = lower -'a';
    return 'A' + position_in_alphabet;
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("usage: ./eau06.o \"string\"");
        return 1;
    }

    char* source = argv[1];
    int length = len(source);

    bool toggle_upper = true;
    for(int i = 0; i < length; i++) {
        if (is_lower_alpha(source[i])) {
            if (toggle_upper) {
                source[i] = to_upper(source[i]);
                toggle_upper = false;
            } else {
                toggle_upper = true;
            }
        }
    }

    printf("%s\n", source);
}

