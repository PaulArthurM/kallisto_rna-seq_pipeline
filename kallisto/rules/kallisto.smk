# Kallisto index building rule
# TODO: add params in config file
rule kallisto_index:
    input:
        getFasta
    output:
        getIndex
    params:
        name="kallisto_index",
        nthread=config["kallisto"]["index"]["nthread"]
    conda:
        "./env/kallisto.yaml"
    shell:
        "kallisto index -i {output} {input}"


# Kallisto quantification rule
# TODO: add params in config file
rule kallisto_quant:
    input:
        p1=getFirstReads,
        p2=getSecondReads,
        idx=getIndex
    output:
        directory(config['kallisto']['directory'] + "{sample}_kallisto")
    params:
        name="kallisto_quant_{sample}",
        nthread=config["kallisto"]["quant"]["nthread"],
        bootstrap=config["kallisto"]["quant"]["bootstrap"]
    conda:
        "./env/kallisto.yaml"
    shell:
        "kallisto quant -t {params.nthread} \
          -i {input.idx} \
          -o {output} \
          -b {params.bootstrap} \
          {input.p1} {input.p2}"
