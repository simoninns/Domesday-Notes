# Example of how to take 54K jpgs and
# split them for BeebEm LVROM emu
cd commN_jpg
n=0
for filename in *
do
    # Get the filename without extension
    basename="${filename%.*}"
    
    # Right pad the basename to 5 characters
    basename=$(printf "%05d" $basename)
    
    # Take the 2 left justified characters as the target directory name
    dirname="../out/${basename:0:2}"
    outname="$dirname/$filename"
    
    [ -d "$dirname" ] || mkdir "$dirname" 
    
    echo "copying" "$filename" "to" "$outname"
    cp "$filename" "$outname"
done
