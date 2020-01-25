include: "workflow/rules/functions.smk"
include: "workflow/rules/kallisto.smk"


# Configuration file
configfile: "config/config.yaml"


# Get all inputs
# TODO: add more possible inputs, improve KALLISTO_OUTPUT
def all_input(wildcards):
    wanted_input = []
    KALLISTO_OUTPUT = expand([config['kallisto']['directory'] + "{sample}" + "_kallisto", sample=Sample_sheet.samples)
    wanted_input.extend(KALLISTO_OUTPUT)
    return wanted_input


rule all:
    input: all_input