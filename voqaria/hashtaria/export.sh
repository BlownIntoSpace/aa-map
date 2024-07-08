FILENAME=hashtaria.svg
EXPORT_DIR=./export
TILE_DIR=./tiles

MIN_SCALE=2
MAX_SCALE=8
# Declare layer zoom levels
declare -A LAYERS
LAYERS[base]=$MIN_SCALE-$MAX_SCALE
LAYERS[territories]=$MIN_SCALE-$MAX_SCALE
LAYERS[path]=$MIN_SCALE-$MAX_SCALE
LAYERS[label_small]=5-$MAX_SCALE
LAYERS[label_large]=$MIN_SCALE-4
LAYERS[scale]=$MIN_SCALE-$MAX_SCALE

# Re-create directories
echo "Removing old tiles and exports..."
rm -r ${EXPORT_DIR}
mkdir ${EXPORT_DIR}
rm -r ${TILE_DIR}
mkdir ${TILE_DIR}


# echo "Generating tiles for $FILENAME, with layer ids: ${(k)LAYERS}"
# echo "Layers set to be hidden will not be exported."
# echo "WARNING! Exporting svg layers takes a VERY long time. Please be patient. Inkscape may show as Not Responding, ignore this if possible."
# echo "WARNING! SVGs with pixel dimensions larger than 32000px in any direction will not be exported properly. Please ensure image size is less than 32000px, there is no check in place to ensure this does not happen."


# Export INKSCAPE Layers
for ID in ${(k)LAYERS}
do
    inkscape $FILENAME -i $ID --app-id-tag=ACORNEXPORT --export-area-page --export-id-only --export-filename=${EXPORT_DIR}/${ID}.png
    echo "Exported to $EXPORT_DIR/${ID}.png"
done

# create new conda environment
echo "Creating conda environment"
if conda info --envs | grep -q acornmaptiler; then conda remove -y -n acornmaptiler --all; fi
conda create -y -n acornmaptiler python gdal

# activate conda environment
source $(conda info --base)/etc/profile.d/conda.sh; conda activate; conda activate acornmaptiler

# Create new tiles
for ID in ${(k)LAYERS}
do
    echo "Generating tiles for ${ID}.png"
    gdal2tiles.py -p raster -z ${LAYERS[$ID]} --processes=5 -w leaflet --xyz -x -v --tiledriver=WEBP ${EXPORT_DIR}/${ID}.png ${TILE_DIR}/${ID%_*}
done
echo "Tile generation complete"

# Delete empty directories
echo "Clearing empty directories"
find ./tiles -type d -empty -delete

# Delete conda environment
echo "Tidying up..."
conda deactivate
conda remove -y -n acornmaptiler --all

echo "Done! Tiles exported to ${TILE_DIR}"