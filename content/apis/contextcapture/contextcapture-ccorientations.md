---
title: CC Orientations
displayOrder: 3
---

## CC Orientations

_CC Orientations_ is an XML format that stores Images and Point clouds positioning information, for usage in _Reality Modeling API_ or _iTwin Capture_ desktop applications.

# File format

## Root node

```xml
<?xml version="1.0" encoding="utf-8"?>
<BlocksExchange version="2.1">

</BlocksExchange>
```

This is the node that will contain all the subsequent sections.

## Spatial Reference Systems

```xml
	<SpatialReferenceSystems>
		<SRS>
			<!-- SRS Identifier -->
			<Id>0</Id>
			<!-- User-friendly SRS name. -->
			<Name>Lambert 93</Name>
			<!-- The spatial reference system definition can be either a Well Known Text definition (e.g. WGS84), "EPSG: " or a PROJ.4 definition. -->
			<Definition>EPSG:2154</Definition>
		</SRS>
	</SpatialReferenceSystems>
```

This node is used to provide the list of SRS used in the _CC Orientations_. Multiple SRS can be defined here. `<Id>`s have to be integer.

## Block

The block is the main component of the _CC Orientations_. We will split it in different section for easier understanding.

### Base information

```xml
<Block>
    <!-- Block name and description are optional but recommended -->
    <Name>My first CCOrientations</Name>
    <Description>This is my first CCOrientations</Description>
    <!-- The type of block is optional. Supported types: Generic (default if not specified), Aerial, Nadir and Orbit. -->
    <Type>Nadir</Type>
    <!-- Minmum and maximum viewing distance can be optionally provided with <MinimumViewingDistance> and <MaximumViewingDistance> tags -->
    <MinimumViewingDistance>150</MinimumViewingDistance>
    <MaximumViewingDistance>500</MaximumViewingDistance>
    <!-- ID of the base SRS used in the block. By default, the spatial reference system is assumed to be a local Cartesian coordinate system. -->
    <SRSId>0</SRSId>
</Block>
```

_Name_ and _Description_ are optional, but we recommend you use them for prettier import in _Reality Modeling_.

_Type_ is optional. If your acquisition corresponds to an aerial flight - that is Nadir+Oblique images - we recommend you use the _Aerial_ type. If your acquisition consists only of nadir images, use the _Nadir_ type. Finally, if you are orbiting around a structure - like a Telecom Tower, use the _Orbit_ type.

_MinimumViewingDistance_ and _MaximumViewingDistance_ are used for more robust computations. They apply to all the images in the _CC Orientations_. If you are using _Nadir_ block type, we strongly recommend you set these values based on the height of your flight.

Finally, _SRSId_ should point to an existing id in the _SpatialReferenceSystems_ section.

### Photogroups

A photogroup regroups images sharing the same optical properties - image dimensions, focal length, sensor size, distortion, etc. Multiple photogroups are allowed in a _CC Orientations_.

```xml
<Photogroups>
    <!-- All photos taken using the same physical camera, with identical focal length and dimensions must be gathered in a photogroup. -->
    <Photogroup>
        <!-- Optional a different spatial reference system can be specified for each photogroup with the <SRSId> tag. By default, the SRS of the block is assumed. -->
        <SRSId>0</SRSId>
        <!-- Optionally, a name with the <Name> tag, and a description with a <Description> tag. -->
        <Name>Sony A5000 - 50mm</Name>
        <Description>Acquired on 2020-09-06</Description>
        <!-- Image dimensions, in pixels. -->
        <ImageDimensions>
            <Width>5456</Width>
            <Height>3632</Height>
        </ImageDimensions>
        <!-- Optional camera model type Perspective (default) or Fisheye -->
        <CameraModelType>Perspective</CameraModelType>
        <!-- Optional camera model band Visible (default) or Thermal -->
        <CameraModelBand>Visible</CameraModelBand>
        <!-- Optional multicamera rig index (no rig is used if this tag is unspecified). -->
        <!-- <Rig>1</Rig> -->
        <!-- Sensor's largest dimension, in millimeters. -->
        <SensorSize>23.5</SensorSize>
        <!-- Focal length, in millimeters. This can be either the nominal specification or a closer estimate. -->
        <FocalLength>50</FocalLength>
        <!-- CameraOrientation: XRightYDown (default), XRightYUp (more frequent in photogrammetry), XLeftYDown, XLeftYUp, XDownYRight, XDownYLeft, XUpYRight, XUpYLeft -->
        <CameraOrientation>XRightYDown</CameraOrientation>
        <!-- Principal point, with respect to the sensor center. This field is optional: by default, the sensor center is used as an initial estimate of the principal point. -->
        <PrincipalPoint>
            <!-- 2D image position of the principal point, in pixels. -->
            <!-- The origin is the center of the upper-left image pixel, the x-axis is oriented to the right side of the image, and the y-axis is oriented to the bottom of the image. -->
            <x>2799.72836989663</x>
            <y>1664.19084530151</y>
        </PrincipalPoint>
        <!-- Lens distortion coefficients. This field is optional: by default, no distortion is assumed as an initial estimate. -->
        <!-- Distortion coefficients correspond to the classical Brown's distortion model, as described in http://en.wikipedia.org/wiki/Distortion_(optics). -->
        <Distortion>
            <K1>0.091784043461384</K1>
            <K2>-0.389773692160792</K2>
            <K3>-0.164530007624487</K3>
            <P1>0.00338559469641398</P1>
            <P2>0.00195577545434898</P2>
        </Distortion>
        <!-- Fisheye focal matrix used only for the camera model type Fisheye. -->
        <FisheyeFocalMatrix>
            <M_00>1960</M_00>
            <M_01>0</M_01>
            <M_10>0</M_10>
            <M_11>1960</M_11>
        </FisheyeFocalMatrix>
        <!-- Fisheye distortion coefficients used only for the camera model type Fisheye. -->
        <FisheyeDistortion>
            <P0>0</P0>
            <P1>1</P1>
            <P2>0</P2>
            <P3>0</P3>
            <P4>0</P4>
        </FisheyeDistortion>
        <!-- Multiple photos in a photogroup -->
        <Photo>
            <!-- The ID of a photograph must be unique over the whole block (in other words, even across other photogroups). If you are using Rig, we use this id for photo order-->
            <Id>0</Id>
            <!-- Path of the image based on its CCImageCollection id -->
            <ImagePath>3e4742f9-87fc-4bfa-8ee3-6103555f325f/DSC03885.jpg</ImagePath>
            <!-- Optional path of the image mask based on its CCImageCollection id -->
            <MaskPath>7f7a664f-e11b-4658-84fa-5ada1b0ee7c1/DSC03885_msk.jpg</MaskPath>
            <!-- Optional component Id: 1 is the main component (default), 0 is no component. Photos with incomplete pose cannot belong to the main component -->
            <Component>0</Component>
            <!-- Exterior orientation of the camera, as estimated by navigation devices or aerotriangulation. This field is optional. -->
            <Pose>
                <!-- 3D rotation of the camera in the spatial reference system defined above. -->
                <!-- It defines the rotation matrix transforming world coordinates (in the specified SRS)-->
                <!-- into camera coordinates (with axes defined by the CameraOrientation of the photogroup). -->
                <!-- The rotation is optional: the pose can be limited to the 3D position of the camera center (e.g. when GPS position only is available). -->
                <Rotation>
                    <!-- A 3x3 matrix, using the <M_ij> tags, where M_ij denotes the coefficient of the (i+1)th row and the (j+1)th column of the rotation matrix. -->
                    <M_00>-0.9999982912233401</M_00>
                    <M_01>-0.001636319085375301</M_01>
                    <M_02>-0.0008602425863163225</M_02>
                    <M_10>-0.001631068695467463</M_10>
                    <M_11>0.9999802528616577</M_11>
                    <M_12>-0.00606906089589293</M_12>
                    <M_20>0.0008701565192966738</M_20>
                    <M_21>-0.006067647409696231</M_21>
                    <M_22>-0.9999812130648239</M_22>
                </Rotation>
                <!-- 3D position of the camera center in the spatial reference system defined above. -->
                <!-- Depending on the SRS, x/y may stand either for longitude/latitude, for map projection coordinates, or for something else. -->
                <!-- Depending on the SRS, z may stand either for a geoid height, for an orthometric height, or for something else. -->
                <Center>
                    <x>651999.7159189156</x>
                    <y>6863073.633923346</y>
                    <z>1318.897690166719</z>
                </Center>
            </Pose>
            <!-- Optional depth information can be provided with <NearDepth>, <MedianDepth>, and <FarDepth> tags -->
            <!-- Optional Exif data (each exif data property is optional) -->
            <ExifData>
                <ImageDimensions>
                    <Width>5456</Width>
                    <Height>3632</Height>
                </ImageDimensions>
                <PixelDimensions>
                    <Width>0.02</Width>
                    <Height>0.02</Height>
                </PixelDimensions>
                <GPS>
                    <Latitude>45.5686684</Latitude>
                    <Longitude>2.6551104</Longitude>
                    <Altitude>1589.5469</Altitude>
                </GPS>
                <FocalLength>50</FocalLength>
                <FocalLength35mmEq>75</FocalLength35mmEq>
                <Make>SONY</Make>
                <Model>ILCE-5000</Model>
                <LensModel>E 50mm F1.8 OSS</LensModel>
                <DateTimeOriginal>2020-04-29T06:40:26</DateTimeOriginal>
            </ExifData>
        </Photo>
    </Photogroup>
</Photogroups>
```

Some precisions:

- _FocalLength_ is the nominal or closer estimate of the focal length in millimeters. _SensorSize_ is the largest dimension (usually the width) of the sensor in millimeters.
- _CameraOrientation_ describes the camera. For more information on this topic, on rotations and distortions, see [BlocksExchange XML/XMZ format](https://docs.bentley.com/LiveContent/web/ContextCapture%20Help-v18/en/GUID-59E6CC36-F349-4DE0-A563-FFC47296A624.html).
- If you are using the Rig option: this option enforce a rigid registration between corresponding images in photogroup. Images correspondence is based on photo ids: if you have two photogroups with 3 images each, numbered 0-1-2 and 3-4-5 that are rigged, 0 goes with 3, 1 with 4 and 2 with 5.

The simplest photogroup you can create will look like this:

```xml
<Photogroup>
    <Name>My Photogroup</Name>
    <ImageDimensions>
        <Width>5456</Width>
        <Height>3632</Height>
    </ImageDimensions>
    <CameraModelType>Perspective</CameraModelType>
    <CameraModelBand>Visible</CameraModelBand>
    <FocalLength>50</FocalLength>
    <SensorSize>23.5</SensorSize>
    <CameraOrientation>XRightYDown</CameraOrientation>
    <Photo>
        <Id>0</Id>
        <ImagePath>3e4742f9-87fc-4bfa-8ee3-6103555f325f/DSC03885.JPG</ImagePath>
        <Component>0</Component>
    </Photo>
    <Photo>
        <Id>1</Id>
        <ImagePath>3e4742f9-87fc-4bfa-8ee3-6103555f325f/DSC03886.JPG</ImagePath>
        <Component>0</Component>
    </Photo>
    <Photo>
        <Id>2</Id>
        <ImagePath>3e4742f9-87fc-4bfa-8ee3-6103555f325f/DSC03887.JPG</ImagePath>
        <Component>0</Component>
    </Photo>
</Photogroup>
```

Across photogroups, you need at least 3 images in order to process a _CC Orientations_ in _Reality Modeling_.

As of Reality Modeling Update 19.1, it is possible to use simplified CCOrientations :

```xml
<Photogroup>
    <Name>My Photogroup</Name>
    <ManualOpticalParams>false</ManualOpticalParams>
    <ManualPose>false</ManualPose>
    <Photo>
        <Id>0</Id>
        <ImagePath>3e4742f9-87fc-4bfa-8ee3-6103555f325f/DSC03885.JPG</ImagePath>
        <Component>0</Component>
    </Photo>
    <Photo>
        <Id>1</Id>
        <ImagePath>3e4742f9-87fc-4bfa-8ee3-6103555f325f/DSC03886.JPG</ImagePath>
        <Component>0</Component>
    </Photo>
    <Photo>
        <Id>2</Id>
        <ImagePath>3e4742f9-87fc-4bfa-8ee3-6103555f325f/DSC03887.JPG</ImagePath>
        <Component>0</Component>
    </Photo>
</Photogroup>
```

In this example, we are using two new nodes :

- _ManualPose_ : optional, defaulted to _true_, when set to _false_, the _Pose_ node in the _Photo_ node is ignored and _Reality Modeling_ will automatically fill in the information from the photos exifs.
- _ManualOpticalParams_ : optional, defaulted to _true_, when set to _false_, the optical parameters will be ignored and _Reality Modeling_ will automatically detect the parameters (ignored parameters are : _ImageDimensions_, _CameraModelBand_, _SensorSize_, _CameraModelType_, _FocalLength_, _CameraOrientation_, _PrincipalPoint_, _Distortion_, _FisheyeFocalMatrix_, _FisheyeDistortion_).

Note: the service will not modify the _Photogroup_ structure, it is your responsibility to verify that photos share the same optical parameters when using _ManualOpticalParams_.

You may also give a very simplified CCOrientation using _BulkPhotos_ instead of _Photogroup_ :

```xml
<Block>
    <Name>Block_1</Name>
    <SRSId>1</SRSId>
    <BulkPhotos>
        <Photo>
            <Id>0</Id>
            <ImagePath>3ddee08c-01e8-44a5-8e56-3879109f6728/_3100730.jpg</ImagePath>
        </Photo>
        <Photo>
            <Id>1</Id>
            <ImagePath>3ddee08c-01e8-44a5-8e56-3879109f6728/_3100731.jpg</ImagePath>
        </Photo>
        <Photo>
            <Id>8</Id>
            <ImagePath>3ddee08c-01e8-44a5-8e56-3879109f6728/_3100738.jpg</ImagePath>
        </Photo>
    </BulkPhotos>
    <ControlPoints/>
    <PositioningConstraints/>
</Block>
```

In this case, _Reality Modeling_ will infer all necessary parameters and manage the _Photogroup_ structure itself.

### Control points

```xml
<ControlPoints>
    <!-- Optionally, a different spatial reference system can be specified with the <SRSId> tag.-->
    <!-- By default, the SRS of the block is assumed. -->
    <ControlPoint>
        <Name>Control point #1</Name>
        <!-- Optionally, a different spatial reference system can be specified for each control point with the <SRSId> tag.-->
        <!-- By default, the SRS of the control points container is assumed. -->
        <!-- If specified, a control point can be Full (default), Horizontal or Vertical -->
		<Category>Full</Category>
        <!-- 3D position of the control point in the active spatial reference system. -->
        <!-- Depending on the SRS, x/y may stand either for longitude/latitude, for map projection coordinates, or for something else. -->
        <!-- Depending on the SRS, z may stand either for a geoid height, for an orthometric height, or for something else. -->
        <Position>
            <x>652788.0525588237</x> <!-- Not needed if Category:Vertical -->
            <y>6863015.362218254</y> <!-- Not needed if Category:Vertical -->
            <z>78.07000000122935</z> <!-- Not needed if Category:Horizontal -->
        </Position>
        <!-- Optionally, a control point may be a check point (default: false)-->
        <CheckPoint>true</CheckPoint>
        <!-- If specified, a control point may have accuracies -->
        <HorizontalAccuracy>0.01</HorizontalAccuracy> <!-- Not needed if Category:Vertical -->
        <VerticalAccuracy>0.10</VerticalAccuracy> <!-- Not needed if Category:Horizontal -->

        <!-- Image measurements -->
        <Measurement>
            <!-- ID of the photo where the measurement is taken. The measurements of a control point must have different photo IDs. -->
            <PhotoId>151</PhotoId>
            <!-- 2D image position of the measurement, in pixels. -->
            <!-- The origin is the center of the upper-left image pixel, the x-axis is oriented to the right side of the image, and the y-axis is oriented to the bottom of the image. -->
            <x>7270.31</x>
            <y>6599.44</y>
        </Measurement>
        <Measurement>
            <PhotoId>158</PhotoId>
            <x>1496.69</x>
            <y>6589.94</y>
        </Measurement>
        <Measurement>
            <PhotoId>2104</PhotoId>
            <x>4820.34</x>
            <y>5631.15</y>
        </Measurement>
    </ControlPoint>
</ControlPoints>
```

_ControlPoints_ are not mandatory. They are used to register the images in a specific SRS if needed, or to check the quality of the calibration.

### Tiepoints

```xml
<TiePoints>
    <!-- Optionally, a different spatial reference system can be specified with the <SRSId> tag. By default, the SRS of the block is assumed. -->
    <TiePoint>
        <Name>Left window corner</Name> <!-- Optional, recommended for User Tie Points -->
        <Description></Description> <!-- Description field is only used for internal metadata, do not modify it -->
        <!-- Optionally, a different spatial reference system can be specified for each tie point with the <SRSId> tag. By default, the SRS of the tie points container is assumed. -->
        <!-- Optional id (required for a User tie point if it is referenced in a positioning constraint). -->
		<id>0</id>
        <Color> <!-- Optional, value between 0 and 1 -->
			<Red>0.59</Red>
			<Green>1.0</Green>
        	<Blue>0.0</Blue>
		</Color>
        <!-- If specified, a tie point may be a check point (default: false)-->
        <CheckPoint>true</CheckPoint>
        <!-- Optional position of the tie point in the active spatial reference system -->
        <Position>
            <x>652119.8871409688</x>
            <y>6863304.305716386</y>
            <z>87.79328384995461</z>
        </Position>
        <Measurement>
			<!-- Optional measurement type User or Automatic (default) -->
			<Type>User</Type>
			<PhotoId>146</PhotoId>
			<!-- 2D image position of the measurement, in pixels.-->
      <!-- The origin is the center of the upper-left image pixel, the x-axis is oriented to the right side of the image, and the y-axis is oriented to the bottom of the image. -->
            <x>3324.26001</x>
            <y>9930.269531</y>
		</Measurement>
    </TiePoint>
</TiePoints>
```

Tie points can be stored in an external file:

```xml
<TiePoints>
    <Path>TiePoints.xml</Path>
</TiePoint>
```

With `TiePoints.xml` looking like:

```xml
<?xml version="1.0" encoding="utf-8"?>
<TiePoint>
	<Position>
		<x>-34.4750012078745</x>
		<y>1.15274149210525</y>
		<z>-8.18177676215297</z>
	</Position>
	<Color>
		<Red>0.501960784313725</Red>
		<Green>0.498039215686275</Green>
		<Blue>0.450980392156863</Blue>
	</Color>
	<Measurement>
		<PhotoId>0</PhotoId>
		<x>1660.05517578125</x>
		<y>3084.59497070313</y>
	</Measurement>
	<Measurement>
		<PhotoId>1</PhotoId>
		<x>1346.03332519531</x>
		<y>3067.69970703125</y>
	</Measurement>
	<Measurement>
		<PhotoId>2</PhotoId>
		<x>1366.38330078125</x>
		<y>2920.05126953125</y>
	</Measurement>
</TiePoint>
<TiePoint>
	<Position>
		<x>-28.2683141902494</x>
		<y>0.235531157377353</y>
		<z>-8.31343880296754</z>
	</Position>
	<Color>
		<Red>0.584313725490196</Red>
		<Green>0.592156862745098</Green>
		<Blue>0.513725490196078</Blue>
	</Color>
	<Measurement>
		<PhotoId>0</PhotoId>
		<x>3169.814453125</x>
		<y>3148.72875976563</y>
	</Measurement>
	<Measurement>
		<PhotoId>1</PhotoId>
		<x>2818.83056640625</x>
		<y>3156.552734375</y>
	</Measurement>
	<Measurement>
		<PhotoId>2</PhotoId>
		<x>2755.80639648438</x>
		<y>3047.31640625</y>
	</Measurement>
	<Measurement>
		<PhotoId>3</PhotoId>
		<x>2708.74145507813</x>
		<y>3092.60327148438</y>
	</Measurement>
</TiePoint>
```

## Constraints

```xml
<PositioningConstraints>
    <OriginConstraint> <!-- Maximum one Origin constraint -->
        <O>2</O> <!-- Tiepoint id -->
    </OriginConstraint>
    <ScaleConstraint> <!-- Multiple allowed -->
        <A>0</A>
        <B>3</B>
        <DistanceAB>56.350</DistanceAB>
    </ScaleConstraint>
    <AxisConstraint> <!-- Maximum one Axis or Orientation constraint -->
        <A>0</A>
        <B>3</B>
        <AxisAB>z</AxisAB> <!-- x, y, or z -->
    </AxisConstraint>
    <OrientationConstraint> <!-- Maximum one Orientation or Axis constraint -->
        <A>0</A>
        <B>3</B>
        <C>2</C>
        <AxisAB>z</AxisAB> <!-- x, y or z -->
        <AxisSideC>upperX</AxisSideC> <!-- lowerX, upperX, lowerY, upperY, lowerZ, or upperZ -->
    </OrientationConstraint>
</PositioningConstraints>
```

Positioning constraints are optional.

# Upload CC Orientations on _Reality Management API/PWCS_

Save the file as _Orientations.xml_. For lower space usage, zip it and name it as _Orientations.xmlz_. Tie points file can also be zipped. We recommend the tie points file be named _CCOrientations - Tiepoints.xml_ or _CCOrientations - Tiepoints.xmlz_. Once the files are saved, create a Reality Data using the _Reality Management API_ with reality data type _CCOrientations_, and upload the file(s) to the root of the reality data.
