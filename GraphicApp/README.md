# Simple graphic application

## Example picture

![Example](images/example.png)

## Build and run

Build
```bash
mkdir build; cd build
cmake ..
cmake --build .
```

Run
```bash
./GraphicApp
```

Make LLVM IR of app.c
```bash
cmake --build . --target Gen_LLVM_IR
```
