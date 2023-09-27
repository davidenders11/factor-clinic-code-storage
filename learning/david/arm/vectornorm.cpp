#include <cstdint>


struct Vec2 {
    int64_t x;
    int64_t y;
    void debugPrint() const;
};

int64_t normSquared(Vec2 v) {
    v.debugPrint();
    return v.x * v.x + v.y * v.y;
}