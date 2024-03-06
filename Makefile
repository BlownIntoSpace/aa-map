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

.phony: hashtaria_cities
hashtaria_cities:
	$(CONDA_ACTIVATE) gdal
	cd ./hashtaria/loralel/hammerbak
	rm -rf ./tiles
	gdal2tiles.py -p raster -z 2-6 -w leaflet --xyz -x -v --tiledriver=WEBP ./exports/hammerbak.png ./tiles
	find ./tiles -type d -empty -delete
	cd ../../loralel/lorosh
	rm -rf ./tiles
	gdal2tiles.py -p raster -z 2-6 -w leaflet --xyz -x -v --tiledriver=WEBP ./exports/lorosh.png ./tiles
	find ./tiles -type d -empty -delete

.PHONY: middleearth
middleearth:
	$(CONDA_ACTIVATE) gdal
	rm -rf ./middleearth/tiles
	gdal2tiles.py -p raster -z 2-7 -w leaflet --xyz -x -v --tiledriver=WEBP ./middleearth/mapome.png ./middleearth/tiles

.PHONY: placentia
placentia:
	$(CONDA_ACTIVATE) gdal
	rm -rf ./other/placentia/tiles
	gdal2tiles.py -p raster -z 2-4 -w leaflet --xyz -x -v --tiledriver=WEBP ./other/placentia/exports/bottomdeck.png ./other/placentia/tiles/bottomdeck
	gdal2tiles.py -p raster -z 2-4 -w leaflet --xyz -x -v --tiledriver=WEBP ./other/placentia/exports/middeck.png ./other/placentia/tiles/middeck
	gdal2tiles.py -p raster -z 2-4 -w leaflet --xyz -x -v --tiledriver=WEBP ./other/placentia/exports/topdeck.png ./other/placentia/tiles/topdeck
	gdal2tiles.py -p raster -z 2-4 -w leaflet --xyz -x -v --tiledriver=WEBP ./other/placentia/exports/sails.png ./other/placentia/tiles/sails
	gdal2tiles.py -p raster -z 2-4 -w leaflet --xyz -x -v --tiledriver=WEBP ./other/placentia/exports/crowsnest.png ./other/placentia/tiles/crowsnest
	find ./other/placentia/tiles -type d -empty -delete