#!/usr/bin/env bash


set -o errexit
set -o pipefail

GPU=04

benchit () {
    BENCH="$1"
    echo "=====  $BENCH  ====="

    echo "Opentuner tuning time: $(cat results-gpu$GPU/$BENCH-opentuner.tunetime)"
    echo "Autotuner tuning time: $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)"
    echo $(bc <<< "scale=2; $(cat results-gpu$GPU/$BENCH-opentuner.tunetime) / $(cat results-gpu$GPU/$BENCH-autotuner.tunetime)")

    echo

    echo -n untuned-opentuner
    ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,opentuner}.json

    echo

    echo -n untuned-autotuner
    ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{untuned,autotuner}.json

    echo

    echo -n opentuner-autotuner
    ../futhark/tools/cmp-bench-json.py results-gpu$GPU/$BENCH-{opentuner,autotuner}.json

    echo
}

if [ -z "$1" ]; then
    for BENCH in backprop heston32 lavaMD LocVolCalib lud nw nn OptionPricing srad bfast pathfinder
    do
        benchit "$BENCH"
    done
else
    benchit "$1"
fi
