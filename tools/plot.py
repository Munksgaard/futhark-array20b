#!/usr/bin/env python

import numpy as np
import sys
import json

import matplotlib

matplotlib.use('Agg') # For headless use

import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter
import os

# if int(matplotlib.__version__.split('.')[0]) != 2:
#     raise Exception('Plotting requires Matplotlib version 2.  Installed version is %s.' %
#                     matplotlib.__version__)

outputfile = sys.argv[1]

resultsdir = sys.argv[2]


programs = [
    # ("mapscan1",
    #  "mapscan1",
    #  ("D1", "mapscan-data/mapscan1-2.in"),
    #  ("D2", "mapscan-data/mapscan1-4.in")),

    # ("mapscan2",
    #  "mapscan2",
    #  ("D1", "mapscan-data/mapscan2-2.in"),
    #  ("D2", "mapscan-data/mapscan2-4.in")),

    # # Novel ones
    # ("Heston",
    #  "heston32",
    #  ("1062", "heston32-data/1062_quotes.in"),
    #  ("10000", "heston32-data/10000_quotes.in")),
    # ("OptionPricing",
    #  "OptionPricing",
    #  ("D1", "OptionPricing-data/D1.in"),
    #  ("D2", "OptionPricing-data/D2.in")),

    # # Pure ones
    # ("Backprop",
    #  "backprop",
    #  ("D1", "backprop-data/D1.in"),
    #  ("D2", "backprop-data/D2.in")),
    # ("LavaMD",
    #  "lavaMD",
    #  ("D1", "lavaMD-data/D1.in"),
    #  ("D2", "lavaMD-data/D2.in")),
    # ("NW",
    #  "nw",
    #  ("D1", "nw-data/D1.in"),
    #  ("D2", "nw-data/D2.in")),

    # # Modified ones
    # ("NN",
    #  "nn",
    #  ("D1", "nn-data/D1.in"),
    #  ("D2", "nn-data/D2.in")),

    ("LUD",
     "lud",
     ("2048", "lud-data/2048.in"),
     ("256", "lud-data/256.in")),
]

if resultsdir == "results-gpu04":
    programs.append(("SRAD",
     "srad",
     ("D1", "srad-data/D1.in"),
     ("D2", "srad-data/D2.in")))
    programs.append(("Pathfinder",
     "pathfinder",
     ("D1", "pathfinder-data/D1.in"),
     ("D2", "pathfinder-data/D2.in")))

    programs.append(("LocVolCalib",
     "LocVolCalib",
     ("D1", "LocVolCalib-data/small.in"),
     ("D2", "LocVolCalib-data/large.in")))
    programs.append(("BFast",
     "bfast",
     ("D1", "bfast-data/D1.in"),
     ("peru", "bfast-data/peru.in")))


def plotting_info(x):
    name, filename, d1, d2 = x

    untuned_results = json.load(open('{}/{}-untuned.json'.format(resultsdir,filename)))
    autotuner_results = json.load(open('{}/{}-autotuner.json'.format(resultsdir,filename)))
    opentuner_results = json.load(open('{}/{}-opentuner.json'.format(resultsdir,filename)))
    # baseline_results = {}
    handwritten_results = {}

    print("opentuner: ", opentuner_results)

    # try:
    #     baseline_results = json.load(open('results/{}-baseline.json'.format(filename)))
    # except:
    #     pass

    # try:
    #     handwritten_results = json.load(open('results/{}-rodinia.json'.format(filename)))
    # except:
    #     pass

    # try:
    #     handwritten_results = json.load(open('results/{}-finpar.json'.format(filename)))
    # except:
    #     pass

    fut_name = 'benchmarks/{}.fut'.format(filename)
    # baseline_fut_name = 'benchmarks/{}-baseline.fut'.format(filename)

    def for_dataset(d):
        untuned_runtime = np.mean(untuned_results[fut_name]['datasets'][d]['runtimes'])
        autotuner_runtime = np.mean(autotuner_results[fut_name]['datasets'][d]['runtimes'])
        opentuner_runtime = np.mean(opentuner_results[fut_name]['datasets'][d]['runtimes'])

        # try:
        #     untuned_runtime = np.mean(baseline_results[baseline_fut_name]['datasets'][d]['runtimes'])
        # except KeyError:
        #     pass

        # try:
        #     handwritten_runtime = np.mean(handwritten_results[fut_name]['datasets'][d]['runtimes'])
        # except KeyError:
        #     handwritten_runtime = None
        return (untuned_runtime, autotuner_runtime, opentuner_runtime, None)

    return (name, (for_dataset(d1[1]), for_dataset(d2[1])))

print("programs:", programs)

program_plots = map(plotting_info, programs)

print("program_plots:", program_plots)

bars_per_program = map(lambda x: 4, program_plots)
print("bars_per_program: ", bars_per_program)

num_bars = sum(bars_per_program)
print("num_bars: ", num_bars)

num_programs = len(program_plots)
print("num_programs: ", num_programs)

width = 0.25

matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42
font = {'family': 'sans-serif',
        'size' : 9}
plt.rc('font', **font)
plt.rc('text', usetex=True)
grey='#aaaaaa'

i = 0
if resultsdir == "results-gpu04":
    plt.figure(figsize=(10, 1.5))
else:
    plt.figure(figsize=(2, 1.5))

for (program_name, info) in program_plots:
    print('Plotting {}...'.format(program_name))
    (d1, d2) = info
    plt.subplot(1, num_programs, i+1)
    d1_untuned_runtime, d1_autotuner_runtime, d1_opentuner_runtime, d1_handwritten_runtime = d1
    d2_untuned_runtime, d2_autotuner_runtime, d2_opentuner_runtime, d2_handwritten_runtime = d2

    d1_untuned_speedup = d1_untuned_runtime/d1_untuned_runtime
    d1_autotuner_speedup = d1_untuned_runtime/d1_autotuner_runtime
    d1_opentuner_speedup = d1_untuned_runtime/d1_opentuner_runtime
    d1_handwritten_speedup = d1_untuned_runtime/d1_handwritten_runtime if d1_handwritten_runtime else None

    d2_untuned_speedup = d2_untuned_runtime/d2_untuned_runtime
    d2_autotuner_speedup = d2_untuned_runtime/d2_autotuner_runtime
    d2_opentuner_speedup = d2_untuned_runtime/d2_opentuner_runtime
    d2_handwritten_speedup = d2_untuned_runtime/d2_handwritten_runtime if d2_handwritten_runtime else None

    plt.gca().get_yaxis().set_visible(False)

    offset = width if d1_handwritten_runtime else 0

    plt.gca().grid(True, axis='y', linestyle='-', linewidth='2', color='grey')
    plt.gca().set_title(program_name)
    plt.tick_params(
        axis='x',          # changes apply to the x-axis
        which='both',      # both major and minor ticks are affected
        bottom=False,      # ticks along the bottom edge are off
        top=False,         # ticks along the top edge are off
        labelbottom=False) # labels along the bottom edge are off

    offset = width if d1_handwritten_runtime else 0


    d1_untuned_rect, d2_untuned_rect = plt.bar([0, offset + 1],
                                               [d1_untuned_speedup, d2_untuned_speedup], width,
                                               color='#ffcebf', zorder=3, label="Not autotuned")
    d1_opentuner_rect, d2_opentuner_rect = plt.bar([width, offset + 1 + width],
                                                   [d1_opentuner_speedup, d2_opentuner_speedup], width,
                                                   color='#ff0000', zorder=3, label="Opentuner")
    d1_autotuner_rect, d2_autotuner_rect = plt.bar([2 * width, offset + 1 + 2 * width],
                                                   [d1_autotuner_speedup, d2_autotuner_speedup], width,
                                                   color='#ff7c4c', zorder=3, label="Autotuner")

    # if d1_handwritten_speedup and d2_handwritten_speedup:
    #     handwritten_ind = [3 * width, offset + 1 + 3 * width]
    #     handwritten_speedups = [d1_handwritten_speedup, d2_handwritten_speedup]
    # elif d1_handwritten_speedup:
    #     handwritten_ind = [3 * width]
    #     handwritten_speedups = [d1_handwritten_speedup]
    # elif d2_handwritten_speedup:
    #     handwritten_ind = [offset + 1 + 3 * width]
    #     handwritten_speedups = [d2_handwritten_speedup]
    # else:
    #     handwritten_ind = []
    #     handwritten_speedups = []

    # d1_handwritten_rect = None
    # d2_handwritten_rect = None
    # if len(handwritten_ind) > 0:
    #     handwritten_rects = plt.bar(handwritten_ind,
    #                                 handwritten_speedups, width,
    #                                 color='#ffac4c', zorder=3, label="Handwritten")
    #     if d1_handwritten_speedup:
    #         d1_handwritten_rect = handwritten_rects[0]
    #         if d2_handwritten_speedup:
    #             d2_handwritten_rect = handwritten_rects[1]
    #     elif d2_handwritten_speedup:
    #         d2_handwritten_rect = handwritten_rects[0]
    # else:
    #     # Hack to make the legend work.
    #     plt.bar([0], [0], 0, color='#ffac4c', zorder=3, label="Handwritten")

    ymin, ymax = plt.ylim()
    print("ymin: ", ymin, ", ymax: ", ymax)
    notch = ymax/30
    plt.ylim(ymin, ymax+10*notch)

    def rect_it(d, r, ms):
        if r:
            r_ypos = max(3*notch, r.get_y()+r.get_height()+3*notch)
            if r.get_height() < 0.1:
                label = "%.2f" % (round(r.get_height()*100)/100)
            else:
                label = "%.1f" % (round(r.get_height()*10)/10)
            plt.text(r.get_x(), r_ypos * 1.1,
                     label,
                     ha='left', va='baseline', size='smaller', rotation=45)

    rect_it(d1_untuned_speedup, d1_untuned_rect, d1_untuned_runtime)
    rect_it(d2_untuned_speedup, d2_untuned_rect, d2_untuned_runtime)

    rect_it(d1_opentuner_speedup, d1_opentuner_rect, d1_opentuner_runtime)
    rect_it(d2_opentuner_speedup, d2_opentuner_rect, d2_opentuner_runtime)

    rect_it(d1_autotuner_speedup, d1_autotuner_rect, d1_autotuner_runtime)
    rect_it(d2_autotuner_speedup, d2_autotuner_rect, d2_autotuner_runtime)

    # rect_it(d1_handwritten_speedup, d1_handwritten_rect, d1_handwritten_runtime)
    # rect_it(d2_handwritten_speedup, d2_handwritten_rect, d2_handwritten_runtime)

    def time(ref):
        if ref > 1000000:
            return "$%.1fs$" % (ref/1000000)
        elif ref < 5000:
            return "$%.1fms$" % (ref/1000)
        else:
            return "${}ms$".format(int(ref/1000))


    plt.text(d1_untuned_rect.get_x() + width + offset/2, -6*notch, time(d1_untuned_runtime),
             ha='center', va='baseline', weight='bold')
    plt.text(d1_untuned_rect.get_x() + width + offset/2, -12*notch, 'D1',
             ha='center', va='baseline', weight='bold', size='larger')
    plt.text(d2_untuned_rect.get_x() + width + offset/2, -6*notch, time(d2_untuned_runtime),
             ha='center', va='baseline', weight='bold')
    plt.text(d2_untuned_rect.get_x() + width + offset/2, -12*notch, 'D2',
             ha='center', va='baseline', weight='bold', size='larger')

    i += 1

plt.legend(bbox_to_anchor=(0,-0.6), loc='lower right', ncol=3, borderaxespad=0.)
plt.rc('text')
print('Rendering {}...'.format(outputfile))
plt.savefig(outputfile, bbox_inches='tight')
