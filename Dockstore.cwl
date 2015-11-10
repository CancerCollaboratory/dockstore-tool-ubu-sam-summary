#!/usr/bin/env cwl-runner

class: CommandLineTool

description: | 
  Output summary statistics per reference for a SAM/BAM file (Aligned reads only).

dct:creator:
  foaf:name: Andy Yang
  foaf:mbox: "mailto:ayang@oicr.on.ca"

requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/cancercollaboratory/dockstore-tool-ubu-sam-summary"
  - { import: node-engine.cwl }

inputs:
  - id: "#in"
    type: File
    description: "Input sam or bam file"
    inputBinding:
      position: 1

  - id: "#header"
    type: File
    description: "Output header"
    inputBinding:
      position: 2

outputs:
  - id: "#out"
    type: File
    description: "Output summary file"
    outputBinding:
      glob:
        engine: cwl:JsonPointer
        script: /job/output1

baseCommand: ["sam-filter"]
