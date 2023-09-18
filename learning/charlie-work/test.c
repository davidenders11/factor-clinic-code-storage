int main() {
    int x = 0;
    int y = 50;
    int z = 0;
    for(int i = 0; i < 10; ++i) {
        x += i;
        y -= i;
        if (x > y)
            ++z;
    }
    return z + x * y;
}