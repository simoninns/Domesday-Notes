#!/bin/bash
# Bash script to process Community N images
#
echo "Domesday Community N script"

# Check if destination directory exists (mapping)
if [ -d "/mnt/md0/Decodes/autoAIV/CommunityN/mapped" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/CommunityN/mapped exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/CommunityN/mapped output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/CommunityN/mapped
fi

# Check if destination directory exists (DOC)
if [ -d "/mnt/md0/Decodes/autoAIV/CommunityN/doc" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/CommunityN/doc exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/CommunityN/doc output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/CommunityN/doc
fi

VBI="false"
MAP="false"
DOC="true"

if [ "$VBI" = "true" ]
then
    echo "Community north side - processing VBI"
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/iands1_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/iands2_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/peterads1_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/simonds1_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/simonds2_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/simonds3_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/simonds4_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/simonds5_commN.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityN/stephends1_commN.tbc

fi

if [ "$MAP" = "true" ]
then
    echo "Community north side - disc mapping"
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/iands1_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands1_commN_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/iands2_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands2_commN_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/peterads1_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/peterads1_commN_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/simonds1_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds1_commN_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/simonds2_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds2_commN_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/simonds3_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds3_commN_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/simonds4_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds4_commN_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/simonds5_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds5_commN_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityN/stephends1_commN.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/stephends1_commN_map.tbc
fi

if [ "$DOC" = "true" ]
then
    echo "Community North side - Dropout correction"
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands1_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands2_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds3_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds4_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/doc/iands1_commN_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands2_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands1_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds3_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds4_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/doc/iands2_commN_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds3_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands1_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands2_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds4_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/doc/simonds3_commN_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds4_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands1_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/iands2_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/mapped/simonds3_commN_map.tbc /mnt/md0/Decodes/autoAIV/CommunityN/doc/simonds4_commN_mapdoc.tbc

fi


