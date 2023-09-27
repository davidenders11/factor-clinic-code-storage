#include <cstdio>
#include <cstring>
#include <memory>

void copyUppercase(char *dest, const char *src);

constexpr size_t MAX_STACK_ARRAY_SIZE = 1024;

void printUpperCase(const char *s) {
    auto sSize = strlen(s);
    if (sSize <= MAX_STACK_ARRAY_SIZE) {
        char temp[sSize + 1];
        copyUppercase(temp, s);
        puts(temp);
    } else {
        // std::make_unique_for_overwrite is missing on Godbolt.
        std::unique_ptr<char[]> temp(new char[sSize + 1]);
        copyUppercase(temp.get(), s);
        puts(temp.get());
    }
}