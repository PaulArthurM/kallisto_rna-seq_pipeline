# Get all inputs
# TODO: add more possible inputs
def all_input(wildcards):
    wanted_input = []

    sample_table = pep.sample_table

    samples = [row['sample_name'] + "-" + row['organism'] + "_" + row['cell_line'] + "." + row['type'] for index, row in sample_table.iterrows()]

    wanted_input.extend(list(map(lambda x: f"results/kallisto_results/{x}_kallisto", samples)))

    return wanted_input
