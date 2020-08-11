#!/bin/bash
# Bash script to process Community S images
#
echo "Domesday Community N script"

# Check if destination directory exists (mapping)
if [ -d "/mnt/md0/Decodes/autoAIV/CommunityS/mapped" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/CommunityS/mapped exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/CommunityS/mapped output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/CommunityS/mapped
fi

# Check if destination directory exists (DOC)
if [ -d "/mnt/md0/Decodes/autoAIV/CommunityS/doc" ] 
then
    # Destination exists
    echo "Directory /mnt/md0/Decodes/autoAIV/CommunityS/doc exists - reusing"
else
    # Create the destination directories
    echo "Creating /mnt/md0/Decodes/autoAIV/CommunityS/doc output directory..."
    mkdir /mnt/md0/Decodes/autoAIV/CommunityS/doc
fi

VBI="false"
MAP="false"
DOC="true"

if [ "$VBI" = "true" ]
then
    echo "Community south side - processing VBI"
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/iands1_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/iands2_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/iands3_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/peterads1_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/simonds1_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/simonds2_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/simonds3_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/simonds4_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/simonds5_commS.tbc
    ld-process-vbi /mnt/md0/Decodes/autoAIV/CommunityS/stephends1_commS.tbc

fi

if [ "$MAP" = "true" ]
then
    echo "Community south side - disc mapping"
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/iands1_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands1_commS_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/iands2_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands2_commS_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/iands3_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands3_commS_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/peterads1_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/peterads1_commS_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/simonds1_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds1_commS_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/simonds2_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds2_commS_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/simonds3_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds3_commS_map.tbc
    ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/simonds4_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds4_commS_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/simonds5_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds5_commS_map.tbc
    #ld-discmap --delete-unmappable-frames /mnt/md0/Decodes/autoAIV/CommunityS/stephends1_commS.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/stephends1_commS_map.tbc
fi

if [ "$DOC" = "true" ]
then
    echo "Community south side - Dropout correction"
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands1_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands2_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/peterads1_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds4_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/doc/iands1_commS_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands2_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands1_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/peterads1_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds4_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/doc/iands2_commS_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityS/mapped/peterads1_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands1_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands2_commS_map.tbc  /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds4_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/doc/peterads1_commS_mapdoc.tbc
    
    ld-dropout-correct /mnt/md0/Decodes/autoAIV/CommunityS/mapped/simonds4_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands1_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/iands2_commS_map.tbc /mnt/md0/Decodes/autoAIV/CommunityS/mapped/peterads1_commS_map.tbc  /mnt/md0/Decodes/autoAIV/CommunityS/doc/simonds4_commS_mapdoc.tbc
fi


