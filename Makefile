.ONESHELL:

SHELL = /bin/zsh

CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh; conda activate; conda activate

.PHONY: install
install:
	conda create -n gdal python gdal

.PHONY: uninstall
install:
	conda remove -n gdal --all

.PHONY: hashtaria
hashtaria:
	$(CONDA_ACTIVATE) gdal
	rm -rf ./hashtaria/tiles
	gdal2tiles.py -p raster -z 2-7 -w leaflet --xyz -x -v --tiledriver=WEBP ./hashtaria/exports/base.png ./hashtaria/tiles/continent
	gdal2tiles.py -p raster -z 2-7 -w leaflet --xyz -x -v --tiledriver=WEBP ./hashtaria/exports/hexes.png ./hashtaria/tiles/scale
	gdal2tiles.py -p raster -z 4-7 -w leaflet --xyz -x -v --tiledriver=WEBP ./hashtaria/exports/label_small.png ./hashtaria/tiles/label
	gdal2tiles.py -p raster -z 2-3 -w leaflet --xyz -x -v --tiledriver=WEBP ./hashtaria/exports/label_large.png ./hashtaria/tiles/label
	gdal2tiles.py -p raster -z 2-7 -w leaflet --xyz -x -v --tiledriver=WEBP ./hashtaria/exports/path.png ./hashtaria/tiles/path
	find ./hashtaria/tiles -type d -empty -delete

.PHONY: middleearth
middleearth:
	$(CONDA_ACTIVATE) gdal
	rm -rf ./middleearth/tiles
	gdal2tiles.py -p raster -z 2-7 -w leaflet --xyz -x -v --tiledriver=WEBP ./middleearth/mapome.png ./middleearth/tiles
