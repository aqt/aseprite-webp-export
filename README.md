# Aseprite Indexed WebP Export

This is an extension for [Aseprite](https://www.aseprite.org/), an image and animation editor for pixel art. It allows you to export sprites using the indexed color mode as WebP images. Aseprite does not support this case as of writing.

## Installation

Extensions are natively supported by Aseprite.

1. Download the _aseprite-extension_ file from the [releases](https://github.com/aqt/aseprite-webp-export/releases/latest) tab
2. Open the file with Aseprite. You can also install it by navigating to _Edit_ &rarr; _Preferences_ &rarr; _Extensions_ &rarr; _Add Extension_

## Usage

1. Open your sprite in Aseprite
2. Open the File menu
3. Press _Export indexed WebP_
4. Choose the save location in the dialog that appears
5. Click _OK_ to export

> **Note** _Export indexed WebP_ is grayed out if the sprite is not using indexed colors

> **Note** When the export runs you will receive a security warning, prompting you to accept the script writing the exported file.

## Compatibility

This extension was written for Aseprite v1.2.40.

## Bug Reports and Feature Requests

If you encounter any bugs please submit an issue on the [issue tracker](https://github.com/aqt/aseprite-webp-export/issues). When submitting an issue, provide a clear and detailed description, including steps to reproduce the problem.

You may also submit feature requests. I am however not likely to implement them and will instead defer to the community to provide pull requests or fork the extension. I only wanted to scratch an immediate itch, and I assume this extension will become obsolete once the functionality it provides is prioritized for Aseprite development.

## Development

Refer to the [Aseprite API documentation](https://aseprite.org/api/).

When building the project you can run the [build.sh](build.sh) script. Alternatively, manually create a zip file of the contents of the [src](src) directory and change the file extension from `.zip` to `.aseprite-extension`.

## License

By contributing code to this extension you agree that your contributions will be licensed under the same [license](LICENSE) as the project.
