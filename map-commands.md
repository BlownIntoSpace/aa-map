# Map Commands

referenced to ``world.blowninto.space`` directory.

conda create -n gdal
conda install gdal
conda activate gdal


## Hashtaria
```
gdal2tiles.py -p raster -z 2-8 -w leaflet --xyz -x -v --tiledriver=PNG ./hashtaria/map.png ./hashtaria/tiles

```

## Extras
### Middle Earth
```
gdal2tiles.py -p raster -z 2-8 -w leaflet --xyz -x -v --tiledriver=PNG ./middleearth/mapome.png ./middleearth/tiles


```
