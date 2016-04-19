#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt
import sys

from wordcount import load_word_counts


def plot_word_counts(counts, limit=10):
    """
    Given a list of (word, count, percentage) tuples, plot the counts as a
    histogram. Only the first limit tuples are plotted.
    """
    plt.title("Word Counts")
    limited_counts = counts[0:limit]
    word_data = [word for (word, _, _) in limited_counts]
    count_data = [count for (_, count, _) in limited_counts]
    position = np.arange(len(word_data))
    width = 0.8
    ax = plt.axes()
    ax.set_xticks(position + (width / 2))
    ax.set_xticklabels(word_data)
    plt.bar(position, count_data, width, color='b')

if __name__ == '__main__':
    input_file = sys.argv[1]
    limit = 10
    if len(sys.argv) > 3:
        limit = int(sys.argv[3])
    counts = load_word_counts(input_file)
    plot_word_counts(counts, limit)

    try:
        # save to file if an output filename was given
    	output_file = sys.argv[2]
        plt.savefig(output_file)
    except:
        # if no output filename was given, plot to screen
        plt.show()
