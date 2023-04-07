#!/bin/bash
reset
clang -lobjc -framework Foundation -framework AppKit -framework QuartzCore -o TestSuite.app/TestSuite src/*.m