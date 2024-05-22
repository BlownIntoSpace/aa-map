.ONESHELL:

SHELL = /bin/zsh

CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh; conda activate; conda activate

.PHONY: install
install:
	conda create -n gdal python gdal

.PHONY: uninstall
install:
	conda remove -n gdal --all


.PHONY: middleearth
middleearth:
	$(CONDA_ACTIVATE) gdal
	rm -rf ./middleearth/tiles
	gdal2tiles.py -p raster -z 2-7 -w leaflet --xyz -x -v --tiledriver=WEBP ./middleearth/mapome.png ./middleearth/tiles

