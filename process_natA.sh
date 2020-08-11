#!/bin/bash
# Bash script to process National A images
#
echo "Domesday National A script"

# Check if destination directory exists (mapping)
if [ -d "/mnt/md0/Decodes/autoAIV/NationalA/mapped" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/NationalA/mapped exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/NationalA/mapped output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/NationalA/mapped
fi

# Check if destination directory exists (DOC)
if [ -d "/mnt/md0/Decodes/autoAIV/NationalA/doc" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/NationalA/doc exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/NationalA/doc output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/NationalA/doc
fi

VBI="false"
MAP="true"
DOC="true"

if [ "$VBI" = "true" ]
then
    echo "National A side - processing VBI"
    #ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/iands1_nationalA.tbc
    #ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/iands2_nationalA.tbc
    #ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/iands3_nationalA.tbc
    #ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/peterads1_nationalA.tbc
    #ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/simonds1_nationalA1.tbc
    #ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/simonds1_nationalA2.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/simonds2_nationalA.tbc
    #ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/simonds3_nationalA.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/simonds4_nationalA.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/simonds5_nationalA.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalA/stephends1_nationalA.tbc
fi

if [ "$MAP" = "true" ]
then
    echo "National A side - disc mapping"
    # Note: iands2 does not successfully map when last tested...
    #ld-discmap /mnt/md0/Decodes/autoAIV/NationalA/iands1_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/iands1_nationalA_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/iands2_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/iands2_nationalA_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/iands3_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/iands3_nationalA_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/peterads1_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/peterads1_nationalA_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/simonds1_nationalA1.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds1_nationalA1_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/simonds1_nationalA2.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds1_nationalA2_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/simonds2_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds2_nationalA_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/simonds3_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds3_nationalA_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/simonds4_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds4_nationalA_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/simonds5_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds5_nationalA_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalA/stephends1_nationalA.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/stephends1_nationalA_map.tbc
fi

if [ "$DOC" = "true" ]
then
    echo "National A side - Dropout correction"
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds2_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds4_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds5_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/stephends1_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/simonds2_nationalA_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds4_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds2_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds5_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/stephends1_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/simonds4_nationalA_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds5_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds2_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds4_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/stephends1_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/simonds5_nationalA_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalA/mapped/stephends1_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds4_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds2_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/mapped/simonds5_nationalA_map.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/stephends1_nationalA_mapdoc.tbc
fi

# Note: Could try the following command to cross-repair after initial DOC based on ld-decode RF analysis?
# ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalA/doc/simonds4_nationalA_mapdoc.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/simonds2_nationalA_mapdoc.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/simonds5_nationalA_mapdoc.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/stephends1_nationalA_mapdoc.tbc /mnt/md0/Decodes/autoAIV/NationalA/doc/simonds4_nationalA_mapdoc2.tbc

