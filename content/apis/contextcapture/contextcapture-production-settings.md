---
title: Production Settings
displayOrder: 4
---

## Production Settings

Production settings are a set of optional settings that allow you to specify different options and their usage to produce an output closer to what you’d like.

## Specifying production settings

If you want to apply specific settings to the productions - that is outputs like _3MX_, _OBJ_, etc. - you can add a file in the workspace reality data: the file `prod_settings.json` has to be uploaded to `/{jobId}/data/`.
Note that no check on the uploaded file is performed until the job is actually submitted, and if the parameters are not fitted to the inputs, the job will fail.
Also, if you provide this file, all the outputs should be present in the file.
That is, if you requested _OBJ_ and _FBX_, both of these outputs should be present in the file, even if you only want to apply specific settings to the _OBJ_ format, see the example.

Example of a production settings file

```json
{
  "ProductionSettingsExchange": [
    {
      "name": "OBJ",
      "settings": {
        "TexturedEnabled": false,
        "DoublePrecision": true
      }
    },
    {
      "name": "FBX",
      "settings": ""
    }
  ]
}
```

## List of existing production settings

You will find here a complete list of the existing options for the existing _Reality Modeling_ formats.

### 3SM

The following options are available for Bentley Scalable Mesh (3SM).

3SM sample

```json
{
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "2048",
  "TextureSharpening": "100",
  "LODType": "Adaptive",
  "LODScope": "AcrossTiles",
  "SRS": "EPSG:xxxx"
}
```

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `Adaptive` (Adaptive tree)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

### 3MX

The following options are available for Legacy 3MX.

3MX sample

```json
{
  "SkirtLength": "0",
  "TileOverlap": "-1",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "8192",
  "TextureSharpening": "100",
  "SRS": "EPSG:xxxx",
  "SRSOrigin": "15.0; 2.3; -25.3",
  "LODType": "Adaptive",
  "LODScope": "TileWise",
  "LODSize": "2.82842712474619",
  "GenerateWebGLApp": "false",
  "IncludeProxy3DModel": "false",
  "SiblingsShareTextureMaps": "true"
}
```

###### SkirtLength

`double` The skirt is an additional border included around each geometry node to avoid cracks between the different parts of the mesh. The skirt length is given in pixels.

###### TileOverlap

`double` TileOverlap handles the overlap distance between two tiles in order to avoid gaps. The size is in units/meters/feet depending of the coordinate systems of the production.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### SRSOrigin

`string` SRSOrigin describes the origin of the Spatial Reference System.

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `None` (None)
- `Adaptive` (Adaptive tree)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### LODSize

`double` LODSize specifies the size of the nodes for the Level of Details.
Possible values are:

- `2.82842712474619` (2XL)
- `2` (XL)
- `1.4142135623731` (Large)
- `1` (Medium)

###### GenerateWebGLApp

`bool` GenerateWebGLApp sets if the web application is generated. The web application is needed if you want to host your model on your own server.

###### IncludeProxy3DModel

`bool` IncludeProxy3DModel sets if a proxy model is generated for the web application.

###### SiblingsShareTextureMaps

`bool` SiblingsShareTextureMaps specifies if the siblings in the same Level of Details level should share texture maps.

### OBJ

The following options are available for OBJ wavefront format.

OBJ sample

```json
{
  "SkirtLength": "0",
  "TileOverlap": "-1",
  "LODType": "None",
  "LODScope": "TileWise",
  "LODSize": "2.82842712474619",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "8192",
  "TextureSharpening": "100",
  "TouchupEnabled": "false",
  "SRS": "EPSG:xxxx",
  "SRSOrigin": "15.0; 2.3; -25.3",
  "DoublePrecision": "false"
}
```

###### SkirtLength

`double` The skirt is an additional border included around each geometry node to avoid cracks between the different parts of the mesh. The skirt length is given in pixels.

###### TileOverlap

`double` TileOverlap handles the overlap distance between two tiles in order to avoid gaps. The size is in units/meters/feet depending of the coordinate systems of the production.

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `None` (None)
- `Unary` (Simple levels)
- `Quadtree` (Quadtree)
- `Octree` (Octree)
- `Adaptive` (Adaptive tree)
- `BingMaps` (Bing Maps Tile System)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### LODSize

`double` LODSize specifies the size of the nodes for the Level of Details.
Possible values are:

- `2.82842712474619` (2XL)
- `2` (XL)
- `1.4142135623731` (Large)
- `1` (Medium)

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### TouchupEnabled

`bool` TouchupEnabled specifies if the production is intended for future retouching.

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### SRSOrigin

`string` SRSOrigin describes the origin of the Spatial Reference System.

###### DoublePrecision

`bool` DoublePrecision sets if the production is written with double precision.

### Cesium 3D Tiles

The following options are available for Cesium 3D Tiles.

Cesium 3D Tiles sample

```json
{
  "SkirtLength": "0",
  "TileOverlap": "-1",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "2048",
  "TextureSharpening": "100",
  "LODType": "Adaptive",
  "LODScope": "TileWise",
  "LODSize": "2.82842712474619",
  "SRS": "EPSG:xxxx",
  "GenerateCesiumApp": "true",
  "VertexNormal": "true",
  "Compress": "None"
}
```

###### SkirtLength

`double` The skirt is an additional border included around each geometry node to avoid cracks between the different parts of the mesh. The skirt length is given in pixels.

###### TileOverlap

`double` TileOverlap handles the overlap distance between two tiles in order to avoid gaps. The size is in units/meters/feet depending of the coordinate systems of the production.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `Adaptive` (Adaptive tree)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### LODSize

`double` LODSize specifies the size of the nodes for the Level of Details.
Possible values are:

- `2.82842712474619` (2XL)
- `2` (XL)
- `1.4142135623731` (Large)
- `1` (Medium)

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### GenerateCesiumApp

`bool` GenerateCesiumApp sets if a minimal Cesium application is generated.

###### VertexNormal

`bool` VertexNormal sets if vertex normal are computed.

###### Compress

`string` Compress sets the compression method for the production.
Possible values are:

- `None` (No compression)
- `Draco` (Draco compression)

### ESRI i3s

The following options are available for ESRI Indexed 3d Scene Layer (I3S).

ESRI i3s sample

```json
{
  "SkirtLength": "0",
  "TileOverlap": "-1",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "2048",
  "TextureSharpening": "100",
  "LODType": "Adaptive",
  "LODScope": "TileWise",
  "LODSize": "2.82842712474619",
  "SRS": "EPSG:xxxx",
  "VertexNormal": "true",
  "FormatVersion": "1.8"
}
```

###### SkirtLength

`double` The skirt is an additional border included around each geometry node to avoid cracks between the different parts of the mesh. The skirt length is given in pixels.

###### TileOverlap

`double` TileOverlap handles the overlap distance between two tiles in order to avoid gaps. The size is in units/meters/feet depending of the coordinate systems of the production.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `Octree` (Octree)
- `Adaptive` (Adaptive tree)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### LODSize

`double` LODSize specifies the size of the nodes for the Level of Details.
Possible values are:

- `2.82842712474619` (2XL)
- `2` (XL)
- `1.4142135623731` (Large)
- `1` (Medium)

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### VertexNormal

`bool` VertexNormal sets if vertex normal are computed.

###### FormatVersion

`string` FormatVersion specifies the version for ESRI production.
Possible values are:

- `1.6` (i3s version 1.6)
- `1.8` (i3s version 1.8)

### LAS

The following options are available for ASPRS LASer (LAS).

LAS sample

```json
{
  "SRS": "EPSG:xxxx",
  "PointSamplingUnit": "pixel",
  "PointSamplingDistance": "1",
  "CompressionMethod": "None",
  "MergePointClouds": "false",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible"
}
```

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### PointSamplingUnit

`string` PointSamplingUnit specifies the unit used for sampling the production. Pixel means One point every x pixels so that the sampling is relative to the resolution of your input. Meter or unit means One point every x unit so that the sampling is uniform for the point cloud.
Possible values are:

- `pixel` (pixel)
- `meter` (meter)
- `unit` (unit)

###### PointSamplingDistance

`double` PointSamplingDistance sets the sampling distance, relative to the unit chosen.

###### CompressionMethod

`string` CompressionMethod sets the compression method for the production.
Possible values are:

- `None` (No compression)
- `LAZ` (LAZ (compressed LAS))

###### MergePointClouds

`bool` MergePointClouds specifies if point clouds for each tiles is merged at the end of the processing. Beware that for some format with no level of details (LAS for example), setting this option will lead to a very large file.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)

### Orthophoto/DSM

The following options are available for Orthophoto/DSM.

Orthophoto/DSM sample

```json
{
  "SRS": "EPSG:xxxx",
  "SamplingDistance": "0.1",
  "ProjectionMode": "HighestPoint",
  "MaxImagePartDimension": "4096",
  "MergeImageParts": "true",
  "Orthophoto": {
    "Enabled": "true",
    "Format": "GeoTIFF",
    "NoDataValue": "0 0 0",
    "NoDataTransparency": "false",
    "ColorSource": "Reference3dModelVisible",
    "ImageSharpening": "100"
  },
  "DSM": {
    "Enabled": "true",
    "Format": "GeoTIFF",
    "NoDataValue": "-9999"
  },
  "TemperatureMap": {
    "Enabled": "false",
    "Degrees": "Celsius",
    "NoDataValue": "-9999"
  }
}
```

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### SamplingDistance

`double` SamplingDistance specifies the size of a pixel in the raster. Beware, depending of the format, this distance can be specified in degrees.

###### ProjectionMode

`string` ProjectionMode specifies how the geometry is projected on the raster.
Possible values are:

- `HighestPoint` (Highest point)
- `LowestPoint` (Lowest point)

###### MaxImagePartDimension

`int` MaxImagePartDimension sets the maximum size of the output rasters.

###### MergeImageParts

`bool` MergeImageParts specifies if the output rasters are merged in one single file.

###### Orthophoto.Enabled

`bool` Enabled specifies if the Orthophoto output is produced.

###### Orthophoto.Format

`string` Format specifies the Orthophoto output format.
Possible values are:

- `GeoTIFF` (TIFF/GeoTIFF)
- `JPEG` (JPEG)
- `KML_SuperOverlay` (KML Super-overlay)

###### Orthophoto.NoDataValue

`string` NoDataValue specifies the color if there is no data to fill the raster.

###### Orthophoto.NoDataTransparency

`bool` NoDataTransparency specifies the transparency of no data areas.

###### Orthophoto.ColorSource

`string` ColorSource specifies which the color is projected on the raster.
Possible values are:

- `Reference3dModelVisible` (Reference model visible colors)
- `OptimizedComputationVisible` (Optimized computation visible colors)
- `Reference3dModelThermal` (Reference model thermal imagery)
- `OptimizedComputationThermal` (Optimized computation thermal imagery)

###### Orthophoto.ImageSharpening

`int` ImageSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### DSM.Enabled

`bool` Enabled specifies if the DSM output is produced.

###### DSM.Format

`string` Format specifies the DSM output format.
Possible values are:

- `GeoTIFF` (TIFF/GeoTIFF)
- `XYZ` (XYZ)
- `ASC` (ESRI ASCII raster/ASC)

###### DSM.NoDataValue

`double` NoDataValue specifies the value if there is no data to fill the raster.

###### TemperatureMap.Enabled

`bool` Enabled specifies if the Temperature Map output is produced.

###### TemperatureMap.Degrees

`string` Degrees specifies the temperature scale used for the output.
Possible values are:

- `Celsius` (Celsius)
- `Kelvin` (Kelvin)
- `Fahrenheit` (Fahrenheit)

###### TemperatureMap.NoDataValue

`double` NoDataValue specifies the value if there is no data to fill the raster.

### POD

The following options are available for Pointools POD file format.

POD sample

```json
{
  "SRS": "EPSG:xxxx",
  "PointSamplingUnit": "pixel",
  "PointSamplingDistance": "1",
  "TextureEnabled": "true",
  "MergePointClouds": "true",
  "TextureColorSource": "Visible"
}
```

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### PointSamplingUnit

`string` PointSamplingUnit specifies the unit used for sampling the production. Pixel means One point every x pixels so that the sampling is relative to the resolution of your input. Meter or unit means One point every x unit so that the sampling is uniform for the point cloud.
Possible values are:

- `pixel` (pixel)
- `meter` (meter)
- `unit` (unit)

###### PointSamplingDistance

`double` PointSamplingDistance sets the sampling distance, relative to the unit chosen.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### MergePointClouds

`bool` MergePointClouds specifies if point clouds for each tiles is merged at the end of the processing. Beware that for some format with no level of details (LAS for example), setting this option will lead to a very large file.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)

### PLY

The following options are available for Polygon file format (PLY).

PLY sample

```json
{
  "SRS": "EPSG:xxxx",
  "PointSamplingUnit": "pixel",
  "PointSamplingDistance": "1",
  "IncludeNormals": "false",
  "MergePointClouds": "false",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible"
}
```

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### PointSamplingUnit

`string` PointSamplingUnit specifies the unit used for sampling the production. Pixel means One point every x pixels so that the sampling is relative to the resolution of your input. Meter or unit means One point every x unit so that the sampling is uniform for the point cloud.
Possible values are:

- `pixel` (pixel)
- `meter` (meter)
- `unit` (unit)

###### PointSamplingDistance

`double` PointSamplingDistance sets the sampling distance, relative to the unit chosen.

###### IncludeNormals

`bool` IncludeNormals sets if the normals should be included in the production.

###### MergePointClouds

`bool` MergePointClouds specifies if point clouds for each tiles is merged at the end of the processing. Beware that for some format with no level of details (LAS for example), setting this option will lead to a very large file.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)

### OPC

The following options are available for Point Cloud format (OPC).

OPC sample

```json
{
  "SRS": "EPSG:xxxx",
  "PointSamplingUnit": "pixel",
  "PointSamplingDistance": "1",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible"
}
```

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### PointSamplingUnit

`string` PointSamplingUnit specifies the unit used for sampling the production. Pixel means One point every x pixels so that the sampling is relative to the resolution of your input. Meter or unit means One point every x unit so that the sampling is uniform for the point cloud.
Possible values are:

- `pixel` (pixel)
- `meter` (meter)
- `unit` (unit)

###### PointSamplingDistance

`double` PointSamplingDistance sets the sampling distance, relative to the unit chosen.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)

### FBX

The following options are available for Autodesk FBX.

FBX sample

```json
{
  "SkirtLength": "0",
  "TileOverlap": "-1",
  "LODType": "None",
  "LODScope": "TileWise",
  "LODSize": "2.82842712474619",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "8192",
  "TextureSharpening": "100",
  "SRS": "EPSG:xxxx",
  "SRSOrigin": "15.0; 2.3; -25.3",
  "VertexNormal": "true"
}
```

###### SkirtLength

`double` The skirt is an additional border included around each geometry node to avoid cracks between the different parts of the mesh. The skirt length is given in pixels.

###### TileOverlap

`double` TileOverlap handles the overlap distance between two tiles in order to avoid gaps. The size is in units/meters/feet depending of the coordinate systems of the production.

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `None` (None)
- `Unary` (Simple levels)
- `Quadtree` (Quadtree)
- `Octree` (Octree)
- `Adaptive` (Adaptive tree)
- `BingMaps` (Bing Maps Tile System)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### LODSize

`double` LODSize specifies the size of the nodes for the Level of Details.
Possible values are:

- `2.82842712474619` (2XL)
- `2` (XL)
- `1.4142135623731` (Large)
- `1` (Medium)

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### SRSOrigin

`string` SRSOrigin describes the origin of the Spatial Reference System.

###### VertexNormal

`bool` VertexNormal sets if vertex normal are computed.

### LODTreeExport

The following options are available for LOD tree export.

LODTreeExport sample

```json
{
  "SkirtLength": "0",
  "TileOverlap": "-1",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "8192",
  "TextureSharpening": "100",
  "LODType": "Adaptive",
  "LODScope": "TileWise",
  "LODSize": "2.82842712474619",
  "SRS": "EPSG:xxxx"
}
```

###### SkirtLength

`double` The skirt is an additional border included around each geometry node to avoid cracks between the different parts of the mesh. The skirt length is given in pixels.

###### TileOverlap

`double` TileOverlap handles the overlap distance between two tiles in order to avoid gaps. The size is in units/meters/feet depending of the coordinate systems of the production.

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `None` (None)
- `Unary` (Simple levels)
- `Quadtree` (Quadtree)
- `Octree` (Octree)
- `Adaptive` (Adaptive tree)
- `BingMaps` (Bing Maps Tile System)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### LODSize

`double` LODSize specifies the size of the nodes for the Level of Details.
Possible values are:

- `2.82842712474619` (2XL)
- `2` (XL)
- `1.4142135623731` (Large)
- `1` (Medium)

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

### DGN

The following options are available for Bentley DGN format.

DGN sample

```json
{
  "SkirtLength": "0",
  "TileOverlap": "-1",
  "LODType": "None",
  "LODScope": "TileWise",
  "LODSize": "2.82842712474619",
  "TextureEnabled": "true",
  "TextureColorSource": "Visible",
  "TextureColorSourceResRangeMin": "-1",
  "TextureColorSourceResRangeMax": "-1",
  "TextureColorSourceThermalUnit": "Absolute",
  "TextureColorSourceThermalRangeMin": "-1",
  "TextureColorSourceThermalRangeMax": "-1",
  "TextureCompressionQuality": "75",
  "MaximumTextureSize": "8192",
  "TextureSharpening": "100",
  "TouchupEnabled": "false",
  "SRS": "EPSG:xxxx",
  "SRSOrigin": "15.0; 2.3; -25.3"
}
```

###### SkirtLength

`double` The skirt is an additional border included around each geometry node to avoid cracks between the different parts of the mesh. The skirt length is given in pixels.

###### TileOverlap

`double` TileOverlap handles the overlap distance between two tiles in order to avoid gaps. The size is in units/meters/feet depending of the coordinate systems of the production.

###### LODType

`string` LODType specifies the type of Level of Details to be used for the production.
Possible values are:

- `None` (None)
- `Unary` (Simple levels)
- `Quadtree` (Quadtree)
- `Octree` (Octree)
- `Adaptive` (Adaptive tree)
- `BingMaps` (Bing Maps Tile System)

###### LODScope

`string` LODScope specifies the scope of the computation of the Level of Details.
Possible values are:

- `TileWise` (Tile-wise)
- `AcrossTiles` (Across tiles)

###### LODSize

`double` LODSize specifies the size of the nodes for the Level of Details.
Possible values are:

- `2.82842712474619` (2XL)
- `2` (XL)
- `1.4142135623731` (Large)
- `1` (Medium)

###### TextureEnabled

`bool` TextureEnabled activates or deactivates texture in the final production. If deactivated, any additional Texture option is ignored.

###### TextureColorSource

`string` TextureColorSource handles which source to use as texture.
Possible values are:

- `Visible` (Visible colors)
- `Thermal` (Thermal imagery)
- `Resolution` (Resolution of input data)

###### TextureColorSourceResRangeMin

`double` TextureColorSourceResRangeMin sets the resolution value that will be represented as green color in case of Resolution texture.If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceResRangeMax

`double` TextureColorSourceResRangeMax sets the resolution value that will be represented as red color in case of Resolution texture. If you are not using Resolution texture, this option is ignored.

###### TextureColorSourceThermalUnit

`string` TextureColorSourceThermalUnit handles the unit for the Thermal texture. If you are not using Thermal texture, this option is ignored.
Possible values are:

- `Absolute` (Absolute values)
- `Equalized` (Equalized values)
- `Celsius` (Celsius degrees)
- `Fahrenheit` (Fahrenheit degrees)

###### TextureColorSourceThermalRangeMin

`double` TextureColorSourceThermalRangeMin sets the lower bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureColorSourceThermalRangeMax

`double` TextureColorSourceThermalRangeMin sets the upper bound of the temperature color scale. If you are not using Thermal texture, this option is ignored.

###### TextureCompressionQuality

`int` TextureCompressionQuality sets the quality of the output texture.
Possible values are:

- `100` (100% quality JPEG)
- `90` (90% quality JPEG)
- `75` (75% quality JPEG)
- `50` (50% quality JPEG)

###### MaximumTextureSize

`int` MaximumTextureSize sets the maximum size for one texture file.

###### TextureSharpening

`int` TextureSharpening activates the sharpening of the texture once it's computed.
Possible values are:

- `100` (Enabled)
- `0` (Disabled)

###### TouchupEnabled

`bool` TouchupEnabled specifies if the production is intended for future retouching.

###### SRS

`string` SRS specifies the Spatial Reference System for the production. A spatial reference system describes the coordinates system of the produced output. We expect a string Well Known Text definition (e.g. WGS84), "EPSG:" or a PROJ.4 definition. An empty string for this option means you are producing in a local system.

###### SRSOrigin

`string` SRSOrigin describes the origin of the Spatial Reference System.
