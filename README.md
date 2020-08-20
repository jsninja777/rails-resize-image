# Rails Image Resize

## Get image info

**URL** : `/images/info/`

**Method** : `POST`

**CURL Command**

```sh
curl --location --request POST 'http://localhost:3000/images/info' \
--form 'file=@/path/to/file.png'
```

### Success Responses

**Code** : `200 OK`

```json
{
    "success": true,
    "data": {
      "type": "PNG",
      "size": 1024,
      "width": 100,
      "height": 100
    }
}
```

### Error Response

**Code** : `404 NOT FOUND`

```json
{
    "success": false,
    "message": "File is blank or not an image"
}
```


## Resize image

**URL** : `/images/resize/`

**Method** : `POST`

**CURL Command**

```sh
curl --location --request POST 'http://localhost:3000/images/resize' \
--form 'file=@/path/to/file.png' \
--form 'width=150' \
--form 'height=150'
```

### Success Responses

**Code** : `200 OK`

**Response** : `Resized image`

### Error Response

**Code** : `404 NOT FOUND`

```json
{
    "success": false,
    "message": "File is blank or not an image"
}
```
