#!/usr/bin/env ruby

# Obtain file contents
file_content = ARGV[0]

# Place file content in file variable
file = File.open(file_content, "r")

# Read file contents and place it inside variable
content = file.read

# Place string in array one element per line
protein_string = content.scan(/.{1}/)

codon_dict = {
  UUU: 'F',
  UUC: 'F',
  UUA: 'L',
  UUG: 'L',
  UCU: 'S',
  UCC: 'S',
  UCA: 'S',
  UCG: 'S',
  UAU: 'Y',
  UAC: 'Y',
  UAA: 'Stop',
  UAG: 'Stop',
  UGU: 'C',
  UGC: 'C',
  UGA: 'Stop',
  UGG: 'W',
  CUU: 'L',
  CUC: 'L',
  CUA: 'L',
  CUG: 'L',
  CCU: 'P',
  CCC: 'P',
  CCA: 'P',
  CCG: 'P',
  CAU: 'H',
  CAC: 'H',
  CAA: 'Q',
  CAG: 'Q',
  CGU: 'R',
  CGC: 'R',
  CGA: 'R',
  CGG: 'R',
  AUU: 'I',
  AUC: 'I',
  AUA: 'I',
  AUG: 'M',
  ACU: 'T',
  ACC: 'T',
  ACA: 'T',
  ACG: 'T',
  AAU: 'N',
  AAC: 'N',
  AAA: 'K',
  AAG: 'K',
  AGU: 'S',
  AGC: 'S',
  AGA: 'R',
  AGG: 'R',
  GUU: 'V',
  GUC: 'V',
  GUA: 'V',
  GUG: 'V',
  GCU: 'A',
  GCC: 'A',
  GCA: 'A',
  GCG: 'A',
  GAU: 'D',
  GAC: 'D',
  GAA: 'E',
  GAG: 'E',
  GGU: 'G',
  GGC: 'G',
  GGA: 'G',
  GGG: 'G',
}

# Initialize number of different RNA strings
numDifRNAstrings = 1

protein_string.each do | base |
   numDifRNAstrings *= codon_dict.values.count(base)
end

# Multiply by 3 since there are 3 different stop codons
numDifRNAstrings *= 3

numDifRNAstrings %= 1000000
puts numDifRNAstrings
