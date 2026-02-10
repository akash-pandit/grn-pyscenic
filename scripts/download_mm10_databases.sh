#!/usr/bin/env bash

# Downloads required databases (cistarget regulatory features, motif annotations) for
# 

checksum='https://resources.aertslab.org/cistarget/databases/sha256sum.txt'
feather_database_rankings_url='https://resources.aertslab.org/cistarget/databases/mus_musculus/mm10/refseq_r80/mc_v10_clust/gene_based/mm10_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather'
feather_database_scores_url='https://resources.aertslab.org/cistarget/databases/mus_musculus/mm10/refseq_r80/mc_v10_clust/gene_based/mm10_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.scores.feather'

PROJECT_ROOT="$(pwd)/$(dirname ${BASH_SOURCE%/*})"
cistarget_databases="${PROJECT_ROOT}/data/cistarget_databases"
mkdir -p $cistarget_databases

# download cistarget databases
curdir="$(pwd)"
cd $cistarget_databases
for url in $feather_database_rankings_url $feather_database_scores_url; do
    path="$cistarget_databases/$(basename $url)"
    checksum_url="${url}.sha1sum.txt"
    checksum_path="$cistarget_databases/$(basename $checksum_url)"

    [[ -f $path ]] && mv $path $path.old
    wget -P $cistarget_databases $url  # download

    # verify download integrity
    wget -P $cistarget_databases $checksum_url
    sha1sum -c $checksum_path
    [[ $? -ne 0 ]] && rm $path
    rm $checksum_path
done
cd $curdir



motif_database_url="https://resources.aertslab.org/cistarget/motif2tf/motifs-v10nr_clust-nr.mgi-m0.001-o0.0.tbl"
motif_databases="${PROJECT_ROOT}/data/motif_databases"
mkdir -p $motif_databases

path="$motif_databases/$(basename $motif_database_url)"
# no checksum available :(

wget -P $motif_databases $motif_database_url