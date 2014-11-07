# AmpersandVersion

* Add ampersand-version to `"dependencies"` in package.json.
* Add `/*$AMPERSAND_VERSION*/` to the top of the module's main file.
* Add this to the package.json

    ```json
    {
        "browserify": {
            "transform": ["ampersand-version"]
        }
    }
    ```
