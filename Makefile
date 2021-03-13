.PHONY: all clean

BENCHMARKS = backprop heston32 lavaMD LocVolCalib lud nw OptionPricing srad pathfinder nn bfast

BENCHMARK_TARGETS = $(BENCHMARKS:%=benchmarks/%.fut)

UNTUNED_JSON = $(BENCHMARKS:%=results-$(DIKUMACHINE)/%-untuned.json)

OPENTUNER_JSON = $(BENCHMARKS:%=results-$(DIKUMACHINE)/%-opentuner.json)

AUTOTUNER_JSON = $(BENCHMARKS:%=results-$(DIKUMACHINE)/%-autotuner.json)

OPENTUNER_TUNETIME = $(BENCHMARKS:%=results-$(DIKUMACHINE)/%-opentuner.tunetime)

AUTOTUNER_TUNETIME = $(BENCHMARKS:%=results-$(DIKUMACHINE)/%-autotuner.tunetime)

OPENTUNER_TUNINGS = $(BENCHMARKS:%=tunings-$(DIKUMACHINE)/%-opentuner.json)

AUTOTUNER_TUNINGS = $(BENCHMARKS:%=tunings-$(DIKUMACHINE)/%-autotuner.tuning)

all: $(UNTUNED_JSON) $(OPENTUNER_JSON) $(AUTOTUNER_JSON) $(OPENTUNER_TUNETIME) $(AUTOTUNER_TUNETIME) $(OPENTUNER_TUNINGS) $(AUTOTUNER_TUNINGS)

bin/futhark:
	mkdir -p bin
	cd futhark && git checkout e1bbd19adf046be2bac425ef958da6a84a04d408 && stack --local-bin-path ../bin install

bin/futhark-regtiling:
	mkdir -p bin
	cd futhark && git checkout e1bbd19adf046be2bac425ef958da6a84a04d408 && stack --local-bin-path ../bin install
	mv bin/futhark bin/futhark-regtiling

results-$(DIKUMACHINE)/bfast-untuned.json: benchmarks/bfast.fut bin/futhark-regtiling
	mkdir -p results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 bin/futhark-regtiling bench \
	  --backend=opencl --pass-option=--default-tile-size=8 \
	  --pass-option=--default-reg-tile-size=8 --runs=100 --no-tuning --json $@ $<

results-$(DIKUMACHINE)/bfast-opentuner.json: tunings-$(DIKUMACHINE)/bfast-opentuner.json benchmarks/bfast.fut bin/futhark-regtiling
	mkdir -p results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 bin/futhark-regtiling bench \
	  --backend=opencl \
	  --json $@ \
          --runs=1000 \
	  --pass-option=--default-tile-size=8 \
	  --pass-option=--default-reg-tile-size=3 \
	  $$(python tools/tuning_json_to_options.py < $<) \
	  benchmarks/bfast.fut

results-$(DIKUMACHINE)/bfast-autotuner.json: tunings-$(DIKUMACHINE)/bfast-autotuner.tuning benchmarks/bfast.fut bin/futhark-regtiling
	mkdir -p results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 bin/futhark-regtiling bench \
	  --backend=opencl \
          --runs=1000 \
	  --pass-option=--default-tile-size=8 \
	  --pass-option=--default-reg-tile-size=3 \
	  --json $@ \
	  $$(python tools/tuning_to_options.py < $<) \
	  benchmarks/bfast.fut

tunings-$(DIKUMACHINE)/bfast-opentuner.json results-$(DIKUMACHINE)/bfast-opentuner.tunetime: benchmarks/bfast.fut bin/futhark-regtiling
	mkdir -p tunings-$$DIKUMACHINE results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 /usr/bin/time -f '%e' -o results-$$DIKUMACHINE/bfast-opentuner.tunetime \
	  ./futhark-autotune \
	  --futhark-bench="bin/futhark-regtiling bench --pass-option=--default-tile-size=8 --pass-option=--default-reg-tile-size=3" \
	  --compiler="bin/futhark-regtiling opencl" \
	  --stop-after 7200 \
	  --test-limit 10000000 \
	  --bail-threshold=5000 \
	  --save-json tunings-$$DIKUMACHINE/bfast-opentuner.json \
	  $<

tunings-$(DIKUMACHINE)/bfast-autotuner.tuning results-$(DIKUMACHINE)/bfast-autotuner.tunetime: benchmarks/bfast.fut bin/futhark-regtiling
	mkdir -p tunings-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 /usr/bin/time -f '%e' -o results-$$DIKUMACHINE/bfast-autotuner.tunetime \
	  bin/futhark-regtiling autotune \
	  --backend=opencl \
	  --pass-option=--default-tile-size=8 \
	  --pass-option=--default-reg-tile-size=3 \
	  $<
	mv $<.tuning tunings-$$DIKUMACHINE/bfast-autotuner.tuning

results-$(DIKUMACHINE)/%-untuned.json: benchmarks/%.fut bin/futhark
	mkdir -p results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 bin/futhark bench \
	  --backend=opencl --no-tuning --runs=100 --json $@ $<

results-$(DIKUMACHINE)/%-opentuner.json: tunings-$(DIKUMACHINE)/%-opentuner.json benchmarks/%.fut bin/futhark
	mkdir -p results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 bin/futhark bench \
	  --backend=opencl \
          --runs=500 \
	  --json $@ \
	  $$(python tools/tuning_json_to_options.py < $<) \
	  benchmarks/$*.fut

results-$(DIKUMACHINE)/%-autotuner.json: tunings-$(DIKUMACHINE)/%-autotuner.tuning benchmarks/%.fut bin/futhark
	mkdir -p results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 bin/futhark bench \
	  --backend=opencl \
          --runs=500 \
	  --json $@ \
	  $$(python tools/tuning_to_options.py < $<) \
	  benchmarks/$*.fut

tunings-$(DIKUMACHINE)/%-opentuner.json results-$(DIKUMACHINE)/%-opentuner.tunetime: benchmarks/%.fut bin/futhark
	mkdir -p tunings-$$DIKUMACHINE results-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 /usr/bin/time -f '%e' -o results-$$DIKUMACHINE/$*-opentuner.tunetime \
	  ./futhark-autotune \
	  --futhark-bench="bin/futhark bench" \
	  --compiler="bin/futhark opencl" \
	  --stop-after 7200 \
	  --test-limit 10000000 \
	  --bail-threshold=5000 \
	  --save-json tunings-$$DIKUMACHINE/$*-opentuner.json \
	  $<

tunings-$(DIKUMACHINE)/%-autotuner.tuning results-$(DIKUMACHINE)/%-autotuner.tunetime: benchmarks/%.fut bin/futhark
	mkdir -p tunings-$$DIKUMACHINE
	FUTHARK_INCREMENTAL_FLATTENING=1 /usr/bin/time -f '%e' -o results-$$DIKUMACHINE/$*-autotuner.tunetime \
	  bin/futhark autotune \
	  --backend=opencl \
	  $<
	mv $<.tuning tunings-$$DIKUMACHINE/$*-autotuner.tuning

clean:
	rm -rf bin results-$(DIKUMACHINE) tunings-$(DIKUMACHINE)
	make -C benchmarks clean
