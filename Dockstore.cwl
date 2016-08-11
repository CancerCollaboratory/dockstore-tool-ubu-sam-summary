#!/usr/bin/env cwl-runner

class: CommandLineTool

dct:creator:
  foaf:name: Andy Yang
  foaf:mbox: mailto:ayang@oicr.on.ca
cwlVersion: v1.0

requirements:
- class: DockerRequirement
  dockerPull: quay.io/cancercollaboratory/dockstore-tool-ubu-sam-summary
inputs:
  header:
    type: File?
    inputBinding:
      position: 2
      prefix: --header
    doc: Output header
  out:
    type: string
    inputBinding:
      position: 3
      prefix: --out
    doc: Output summary file
  in:
    type: File
    inputBinding:
      position: 1
      prefix: --in
    doc: Input sam or bam file
outputs:
  out:
    type: File
    outputBinding:
      glob: $(inputs.out)

    doc: Output summary file
baseCommand: [java, -jar, /opt/ubu/ubu.jar, sam-summary]
doc: |
  Output summary statistics per reference for a SAM/BAM file (Aligned reads only).

