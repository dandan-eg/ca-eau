#include <stdbool>

bool is_white_space(char c) {
    return c == ' ' || c == '\t' || c == '\n'
}

int len(char* str) {
    int i = 0;
    while (str[i]) {
        i++;
    }

    return i;
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        return 1;
    }

    char* str = argv[1];
    int length = len(str);

    int i = 0;
    while (i < len) {
        char c = 
        while (is_white_space(str[i])) {
            i++;
        }

        i++;
    }

}
