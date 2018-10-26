#!/bin/sh

bhyve -c 6 -m 8G -H -w \
  -s 0,hostbridge \
  -s 3,ahci-cd,$CD_ISO,nocache \
  -s 4,ahci-hd,$HDD1_IMG,nocache \
  -s 5,ahci-hd,$HDD2_IMG,nocache \
  -s 6,ahci-hd,$HDD3_512KB_IMG,nocache,sectorsize=512 \
  -l bootrom,$BOOT_ROM_FDD \
  -s 10,virtio-net,tap0 \
  -s 29,fbuf,tcp=0.0.0.0:5902,w=1024,h=768 \
  -s 30,xhci,tablet \
  -s 31,lpc -l com1,stdio -l com2,/dev/nmdm0A \
$VM_NAME

exit 0
