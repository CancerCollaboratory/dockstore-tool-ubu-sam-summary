#!/usr/bin/env cwl-runner

class: CommandLineTool

description: | 
  Output summary statistics per reference for a SAM/BAM file (Aligned reads only).

dct:creator:
  foaf:name: Andy Yang
  foaf:mbox: "mailto:ayang@oicr.on.ca"

cwlVersion: draft-3

requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/cancercollaboratory/dockstore-tool-ubu-sam-summary"

inputs:
  - id: "#in"
    type: File
    description: "Input sam or bam file"
    inputBinding:
      position: 1
      prefix: "--in"

  - id: "#header"
    type: [ "null", File ]
    description: "Output header"
    inputBinding:
      position: 2
      prefix: "--header"

  - id: "#out"
    type: string 
    description: "Output summary file"
    inputBinding:
      position:  3 
      prefix: "--out"

outputs:
  - id: "#out"
    type: File
    description: "Output summary file"
    outputBinding:
      glob: $(inputs.out)

baseCommand: ["java" , "-jar" , "/opt/ubu/ubu.jar" , "sam-filter"]
