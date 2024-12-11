---
title: 'CC Image Collection Test'
displayOrder: 2
---

## CC Image Collection

A *CC Image Collection* is a collection of images. In the reality data, you need to store a flat list of image files using Reality Data type *CCImageCollection*. For example, this architecture is fine:

```
/
  - DSC_001.jpg
  - DSC_002.jpg
  - ...
```

while this one is not:

```
/
  - DSC_001.jpg
  - DSC_002.jpg
  - ...
  - SecondFlight/
    - DSC_101.jpg
    - DSC_102.jpg
    - ...
```

We advise you use *CC Image Collection* as logical capture units: an acquisition, a flight, etc. You also want the collections to be immutable. Meaning if you want to add images to a CCImageCollection called *DroneCaptureWaterPlant - Flight A*, don't. Create a separate one called *DroneCaptureWaterPlant - Flight A - Addendum* where you will add the remaining images.

Data should be uploaded in a single reality data, with type *CCImageCollection*.