#!/usr/bin/env bash

BENCH=backprop

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

# echo "GPU$GPU"
echo untuned-opentuner

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=heston32

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=lavaMD

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=LocVolCalib

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=lud

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=nw

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=OptionPricing

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=srad

echo "=====  $BENCH  ====="

# GPU=03

# echo "GPU$GPU"
# ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json && ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

echo

BENCH=bfast

echo "=====  $BENCH  ====="

GPU=04

echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"

# echo "GPU$GPU"
echo untuned-opentuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

echo untuned-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

echo opentuner-autotuner
../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json
