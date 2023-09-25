#include <cstdint>

struct Vec2 {
    int64_t x;
    int64_t y;
};

int64_t normSquared(Vec2 v) {
    return v.x * v.x + v.y * v.y;
}

int main() {
    Vec2 v;
    v.x = 3;
    v.y = 4;
    return normSquared(v);
}