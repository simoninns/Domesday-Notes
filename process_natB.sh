#!/bin/bash
# Bash script to process National A images
#
echo "Domesday National B script"

# Check if destination directory exists (mapping)
if [ -d "/mnt/md0/Decodes/autoAIV/NationalB/mapped" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/NationalB/mapped exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/NationalB/mapped output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/NationalB/mapped
fi

# Check if destination directory exists (DOC)
if [ -d "/mnt/md0/Decodes/autoAIV/NationalB/doc" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/NationalB/doc exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/NationalB/doc output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/NationalB/doc
fi

VBI="false"
MAP="true"
DOC="false"

if [ "$VBI" = "true" ]
then
    echo "National B side - processing VBI"
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/iands2_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/iands3_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/peterads1_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/simonds1_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/simonds2_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/simond3_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/simonds4_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/simonds5_nationalB.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/NationalB/stephends1_nationalB.tbc
fi

if [ "$MAP" = "true" ]
then
    echo "National B side - disc mapping"
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/iands2_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/iands2_nationalB_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/iands3_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/iands3_nationalB_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/peterads1_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/peterads1_nationalB_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/simonds1_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds1_nationalB_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/simonds2_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds2_nationalB_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/simond3_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds3_nationalB_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/simonds4_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds4_nationalB_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/simonds5_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds5_nationalB_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/NationalB/stephends1_nationalB.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/stephends1_nationalB_map.tbc
fi

if [ "$DOC" = "true" ]
then
    echo "National B side - Dropout correction"
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalB/mapped/iands2_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/peterads1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds4_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/doc/iands2_nationalB_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalB/mapped/peterads1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/iands2_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds4_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/doc/peterads1_nationalB_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/iands2_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/peterads1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds4_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/doc/simonds1_nationalB_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds4_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/iands2_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/peterads1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/mapped/simonds1_nationalB_map.tbc /mnt/md0/Decodes/autoAIV/NationalB/doc/simonds4_nationalB_mapdoc.tbc

fi


