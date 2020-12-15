# class SampleSheet(object):
#     """docstring for SampleSheet."""
#
#     def __init__(self):
#         super(SampleSheet, self).__init__()
#
#         # Get samples
#         # TODO: add more informations to sample_sheet
#         def getSamples():
#             sample_sheet = config["sample_sheet"]
#             op = open(sample_sheet, "r")
#             lines = op.readlines()
#             return [str(line) for line in lines if line[0] != "#"]
#
#         self.samples = getSamples()



# Get transcriptome fasta for specified species
def getFasta(wildcards):
    if config["species"] == "human":
        return config["references"]["fasta"]["human"]
    elif config["species"] == "mouse":
        return config["references"]["fasta"]["mouse"]


# Get first fastq.gz file at specified location
def getFirstReads(wildcards):
    table = pep.subsample_table[0]
    file = table[table.sample_name.eq(wildcards.sample_name) & table.subsample_name.eq("1")].iloc[0]['file']
    return config['fastq']['directory'] + file


# Get second fastq.gz file at specified location
def getSecondReads(wildcards):
    table = pep.subsample_table[0]
    file = table[table.sample_name.eq(wildcards.sample_name) & table.subsample_name.eq("2")].iloc[0]['file']
    return config['fastq']['directory'] + file


# # Get gtf file for specified species
# def getGTF():
#     if config["species"] == "human":
#         return config["gtf"]["human"]
#     elif config["species"] == "mouse":
#         return config["gtf"]["mouse"]
#
# # Get ChromInfo file location for specified species
# # TODO: add command option
# def getChrInfo():
#     if config["species"] == "human":
#         return config["ChromInfo"]["ChromInfo_human"]
#     elif config["species"] == "mouse":
#         return config["ChromInfo"]["ChromInfo_mouse"]
#
#
# Get transcriptome index file for specified species
def getIndex(wildcards):
    if config["species"] == "human":
        return config["references"]["indexes"]["human"]
    elif config["species"] == "mouse":
        return config["references"]["indexes"]["mouse"]

#Sample_sheet = SampleSheet()
