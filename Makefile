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

RODINIA_RUNS = 10

RODINIA_BENCHMARKS = nw backprop lavaMD lud

RODINIA_BENCHMARK_JSONS = $(RODINIA_BENCHMARKS:%=results-$(DIKUMACHINE)/%-rodinia.json)

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

results-$(DIKUMACHINE)/bfast-autotuner.json: tunings-$(DIKUMACHINE)/bfast-autotuner.tuning benchmarks/bfast.fut bin/futhark
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

## Now for Rodinia scaffolding.  Crufty and hacky.

rodinia_3.1-patched: rodinia_3.1.tar.bz2
	@if ! md5sum --quiet -c rodinia_3.1.tar.bz2.md5; then \
          echo "Your rodinia_3.1.tar.bz2 has the wrong MD5-sum - delete it and try again."; exit 1; fi
	tar jxf rodinia_3.1.tar.bz2
	mv rodinia_3.1 rodinia_3.1-patched
	(cd $@; patch -p1 < ../rodinia_3.1-some-instrumentation.patch)
	chmod +x rodinia_3.1-patched/opencl/lud/run

rodinia_3.1.tar.bz2:
	wget http://www.cs.virginia.edu/~kw5na/lava/Rodinia/Packages/Current/rodinia_3.1.tar.bz2

# This is a development rule that users should never use.
rodinia_3.1-some-instrumentation.patch: rodinia_3.1-patched
	diff -pur rodinia_3.1 rodinia_3.1-patched > $@ || true


# backprop heston32 lavaMD LocVolCalib lud nw OptionPricing bfast

# Skip the first measurement; we treat it as a warmup run.
results-$(DIKUMACHINE)/%-rodinia.runtimes: bin/gpuid rodinia_3.1-patched
	mkdir -p results
	tools/rodinia_run.sh opencl/$* $(RODINIA_RUNS)
	tail -n +2 rodinia_3.1-patched/opencl/$*/runtimes > $@

results-$(DIKUMACHINE)/backprop-rodinia.json: rodinia_3.1-patched tools/rodinia_run.sh
	tools/rodinia_run.sh backprop D1 $(RODINIA_RUNS) > results-$$DIKUMACHINE/backprop-rodinia-D1.runtimes
	tools/rodinia_run.sh backprop D2 $(RODINIA_RUNS) > results-$$DIKUMACHINE/backprop-rodinia-D2.runtimes
	tools/raw_rodinia_to_json.py backprop D1 D2 > $@ || rm -f $@

results-$(DIKUMACHINE)/nw-rodinia.json: rodinia_3.1-patched tools/rodinia_run.sh
	tools/rodinia_run.sh nw D1 $(RODINIA_RUNS) > results-$$DIKUMACHINE/nw-rodinia-D1.runtimes
	tools/rodinia_run.sh nw D2 $(RODINIA_RUNS) > results-$$DIKUMACHINE/nw-rodinia-D2.runtimes
	tools/raw_rodinia_to_json.py nw D1 D2 > $@ || rm -f $@

results-$(DIKUMACHINE)/lavaMD-rodinia.json: rodinia_3.1-patched tools/rodinia_run.sh
	tools/rodinia_run.sh lavaMD D1 $(RODINIA_RUNS) > results-$$DIKUMACHINE/lavaMD-rodinia-D1.runtimes
	tools/rodinia_run.sh lavaMD D2 $(RODINIA_RUNS) > results-$$DIKUMACHINE/lavaMD-rodinia-D2.runtimes
	tools/raw_rodinia_to_json.py lavaMD D1 D2 > $@ || rm -f $@

results-$(DIKUMACHINE)/nn-rodinia.json: rodinia_3.1-patched tools/rodinia_run.sh
	tools/rodinia_run.sh nn D1 $(RODINIA_RUNS) > results-$$DIKUMACHINE/nn-rodinia-D1.runtimes
	tools/raw_rodinia_to_json.py nn D1 > $@ || rm -f $@

results-$(DIKUMACHINE)/srad-rodinia.json: rodinia_3.1-patched tools/rodinia_run.sh
	tools/rodinia_run.sh srad D1 $(RODINIA_RUNS) > results-$$DIKUMACHINE/srad-rodinia-D1.runtimes
	tools/raw_rodinia_to_json.py srad D1 > $@ || rm -f $@

results-$(DIKUMACHINE)/pathfinder-rodinia.json: rodinia_3.1-patched tools/rodinia_run.sh
	tools/rodinia_run.sh pathfinder D1 $(RODINIA_RUNS) > results-$$DIKUMACHINE/pathfinder-rodinia-D1.runtimes
	tools/raw_rodinia_to_json.py pathfinder D1 > $@ || rm -f $@

results-$(DIKUMACHINE)/lud-rodinia.json: rodinia_3.1-patched tools/rodinia_run.sh
	tools/rodinia_run.sh lud D1 $(RODINIA_RUNS) > results-$$DIKUMACHINE/lud-rodinia-D1.runtimes
	tools/rodinia_run.sh lud D2 $(RODINIA_RUNS) > results-$$DIKUMACHINE/lud-rodinia-D2.runtimes
	tools/raw_rodinia_to_json.py lud D1 D2 > $@ || rm -f $@

clean:
	rm -rf bin results-$(DIKUMACHINE) tunings-$(DIKUMACHINE)
	make -C benchmarks clean
