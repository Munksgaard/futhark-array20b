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
    ("LavaMD",
     "lavaMD",
     ("D1", "lavaMD-data/D1.in"),
     ("D2", "lavaMD-data/D2.in")),
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
    ("SRAD",
     "srad",
     ("D1", "srad-data/D1.in"),
     ("D2", "srad-data/D2.in")),
    # ("Pathfinder",
    #  "pathfinder",
    #  ("D1", "pathfinder-data/D1.in"),
    #  ("D2", "pathfinder-data/D2.in")),
    # ("LocVolCalib",
    #  "LocVolCalib",
    #  ("D1", "LocVolCalib-data/small.in"),
    #  ("D2", "LocVolCalib-data/large.in")),
    ("BFast",
     "bfast",
     ("peru", "bfast-data/peru.in"),
     ("sahara", "bfast-data/africa.in")),
    ("LocVolCalib",
     "LocVolCalib",
     ("medium", "LocVolCalib-data/medium.in"),
     ("large", "LocVolCalib-data/large.in"))

]


def plotting_info(x):
    name, filename, d1, d2 = x

    untuned_results1 = json.load(open('{}-1/{}-untuned.json'.format(resultsdir,filename)))
    autotuner_results1 = json.load(open('{}-1/{}-autotuner.json'.format(resultsdir,filename)))
    opentuner_results1 = json.load(open('{}-1/{}-opentuner.json'.format(resultsdir,filename)))

    untuned_results2 = json.load(open('{}-2/{}-untuned.json'.format(resultsdir,filename)))
    autotuner_results2 = json.load(open('{}-2/{}-autotuner.json'.format(resultsdir,filename)))
    opentuner_results2 = json.load(open('{}-2/{}-opentuner.json'.format(resultsdir,filename)))

    untuned_results3 = json.load(open('{}-3/{}-untuned.json'.format(resultsdir,filename)))
    autotuner_results3 = json.load(open('{}-3/{}-autotuner.json'.format(resultsdir,filename)))
    opentuner_results3 = json.load(open('{}-3/{}-opentuner.json'.format(resultsdir,filename)))

    # baseline_results = {}

    # print("opentuner: ", opentuner_results)

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
        untuned_runtime = min(np.min(untuned_results1[fut_name]['datasets'][d]['runtimes']),
                              np.min(untuned_results2[fut_name]['datasets'][d]['runtimes']),
                              np.min(untuned_results3[fut_name]['datasets'][d]['runtimes']))
        autotuner_runtime = min(np.min(autotuner_results1[fut_name]['datasets'][d]['runtimes']),
                                np.min(autotuner_results2[fut_name]['datasets'][d]['runtimes']),
                                np.min(autotuner_results3[fut_name]['datasets'][d]['runtimes']))
        autotuner_runtime_worst = max(np.min(autotuner_results1[fut_name]['datasets'][d]['runtimes']),
                                      np.min(autotuner_results2[fut_name]['datasets'][d]['runtimes']),
                                      np.min(autotuner_results3[fut_name]['datasets'][d]['runtimes']))

        opentuner_runtime = min(np.min(opentuner_results1[fut_name]['datasets'][d]['runtimes']),
                                np.min(opentuner_results2[fut_name]['datasets'][d]['runtimes']),
                                np.min(opentuner_results3[fut_name]['datasets'][d]['runtimes']))
        opentuner_runtime_worst = max(np.min(opentuner_results1[fut_name]['datasets'][d]['runtimes']),
                                      np.min(opentuner_results2[fut_name]['datasets'][d]['runtimes']),
                                      np.min(opentuner_results3[fut_name]['datasets'][d]['runtimes']))

        # try:
        #     untuned_runtime = np.mean(baseline_results[baseline_fut_name]['datasets'][d]['runtimes'])
        # except KeyError:
        #     pass

        # try:
        #     handwritten_runtime = np.mean(handwritten_results[fut_name]['datasets'][d]['runtimes'])
        # except KeyError:
        #     handwritten_runtime = None
        return (float(untuned_runtime), float(autotuner_runtime), float(autotuner_runtime_worst), float(opentuner_runtime), float(opentuner_runtime_worst))

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

width = 0.20

matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42
font = {'family': 'sans-serif',
        'size' : 9}
plt.rc('font', **font)
plt.rc('text', usetex=True)
grey='#aaaaaa'

i = 0
plt.figure(figsize=(10, 1.5))

for (program_name, info) in program_plots:
    print('Plotting {}...'.format(program_name))
    (d1, d2) = info
    plt.subplot(1, num_programs, i+1)
    d1_untuned_runtime, d1_autotuner_runtime, d1_autotuner_worst_runtime, d1_opentuner_runtime, d1_opentuner_worst_runtime = d1
    d2_untuned_runtime, d2_autotuner_runtime, d2_autotuner_worst_runtime, d2_opentuner_runtime, d2_opentuner_worst_runtime = d2

    d1_untuned_speedup = d1_untuned_runtime/d1_untuned_runtime
    d1_autotuner_speedup = d1_untuned_runtime/d1_autotuner_runtime
    d1_autotuner_worst_speedup = d1_untuned_runtime/d1_autotuner_worst_runtime
    d1_opentuner_speedup = d1_untuned_runtime/d1_opentuner_runtime
    d1_opentuner_worst_speedup = d1_untuned_runtime/d1_opentuner_worst_runtime

    d2_untuned_speedup = d2_untuned_runtime/d2_untuned_runtime
    d2_autotuner_speedup = d2_untuned_runtime/d2_autotuner_runtime
    d2_autotuner_worst_speedup = d2_untuned_runtime/d2_autotuner_worst_runtime
    d2_opentuner_speedup = d2_untuned_runtime/d2_opentuner_runtime
    d2_opentuner_worst_speedup = d2_untuned_runtime/d2_opentuner_worst_runtime

    # print(program_name, d1_untuned_runtime, d2_untuned_runtime)
    # print(program_name, d1_opentuner_runtime, d2_opentuner_runtime)
    # print(program_name, d1_opentuner_worst_runtime, d1_opentuner_worst_speedup, d2_opentuner_worst_runtime, d2_opentuner_worst_speedup)
    # print(program_name, d1_autotuner_runtime, d2_autotuner_runtime)



    plt.gca().get_yaxis().set_visible(False)

    offset = width

    plt.gca().grid(True, axis='y', linestyle='-', linewidth='2', color='grey')
    plt.gca().set_title(program_name)
    plt.tick_params(
        axis='x',          # changes apply to the x-axis
        which='both',      # both major and minor ticks are affected
        bottom=False,      # ticks along the bottom edge are off
        top=False,         # ticks along the top edge are off
        labelbottom=False) # labels along the bottom edge are off

    offset = width


    d1_untuned_rect, d2_untuned_rect = plt.bar([0, offset + 1],
                                               [d1_untuned_speedup, d2_untuned_speedup], width,
                                               color='#ffcebf', zorder=3, label="Not autotuned")

    d1_opentuner_rect, d2_opentuner_rect = plt.bar([width, offset + 1 + width],
                                                   [d1_opentuner_speedup, d2_opentuner_speedup], width,
                                                   color='#ff0000', zorder=3, label="Opentuner")

    d1_opentuner_worst_rect, d2_opentuner_worst_rect = plt.bar([2*width, offset + 1 + 2*width],
                                                   [d1_opentuner_worst_speedup, d2_opentuner_worst_speedup], width,
                                                   color='#ffac4c', zorder=3, label="Opentuner (worst)")

    d1_autotuner_rect, d2_autotuner_rect = plt.bar([3 * width, offset + 1 + 3 * width],
                                                   [d1_autotuner_speedup, d2_autotuner_speedup], width,
                                                   color='#ff7c4c', zorder=3, label="Autotuner")
    # d1_autotuner_worst_rect, d2_autotuner_worst_rect = plt.bar([4 * width, offset + 1 + 4 * width],
    #                                                [d1_autotuner_worst_speedup, d2_autotuner_worst_speedup], width,
    #                                                color='#ff7cff', zorder=3, label="Autotuner (worst)")

    ymin, ymax = plt.ylim()
    print("ymin: ", ymin, ", ymax: ", ymax)
    notch = ymax/30
    plt.ylim(ymin, ymax+10*notch)

    def rect_it(d, r, ms):
        if r:
            r_ypos = max(3*notch, r.get_y()+r.get_height()+3*notch)
            if r.get_height() < 0.1:
                label = "%.2fx" % (round(r.get_height()*100)/100)
            else:
                label = "%.1fx" % (round(r.get_height()*10)/10)
            plt.text(r.get_x(), r_ypos * 1.1,
                     label,
                     ha='left', va='baseline', size='smaller', rotation=60)

    rect_it(d1_untuned_speedup, d1_untuned_rect, d1_untuned_runtime)
    rect_it(d2_untuned_speedup, d2_untuned_rect, d2_untuned_runtime)

    rect_it(d1_opentuner_speedup, d1_opentuner_rect, d1_opentuner_runtime)
    rect_it(d2_opentuner_speedup, d2_opentuner_rect, d2_opentuner_runtime)

    rect_it(d1_opentuner_worst_speedup, d1_opentuner_worst_rect, d1_opentuner_worst_runtime)
    rect_it(d2_opentuner_worst_speedup, d2_opentuner_worst_rect, d2_opentuner_worst_runtime)

    rect_it(d1_autotuner_speedup, d1_autotuner_rect, d1_autotuner_runtime)
    rect_it(d2_autotuner_speedup, d2_autotuner_rect, d2_autotuner_runtime)

    # rect_it(d1_autotuner_worst_speedup, d1_autotuner_worst_rect, d1_autotuner_worst_runtime)
    # rect_it(d2_autotuner_worst_speedup, d2_autotuner_worst_rect, d2_autotuner_worst_runtime)

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

plt.legend(bbox_to_anchor=(0,-0.6), loc='lower right', ncol=4, borderaxespad=0.)
plt.rc('text')
print('Rendering {}...'.format(outputfile))
plt.savefig(outputfile, bbox_inches='tight')
