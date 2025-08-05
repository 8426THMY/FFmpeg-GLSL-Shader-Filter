# FFmpeg GLSL Shader Filter
A very simple FFmpeg filter that lets you run videos through your own GLSL shaders. It currently supports multiple inputs (although they all need to have the same resolution) and provides the current timestamp (in seconds) as a shader input. Eventually, I'd like to update this to support RetroArch shaders.

# Dependencies
This filter uses SDL2 (which is used by FFmpeg by default) and GLEW (which is not). Make sure you

# Building
On Linux, simply install GLEW using your package manager, apply the patch `ffmpeg_glsl_shader.patch` and build as usual (making sure SDL2 is enabled).

On Windows, you can always copy the process above, but I recommend [media-autobuild_suite](https://github.com/m-ab-s/media-autobuild_suite). Install GLEW, copy `ffmpeg_glsl_shader.patch` and `ffmpeg_extra.sh` into the media-autobuild_suite's build directory and build as usual. If you're dumb like me and can't get media-autobuild_suite to install GLEW, you can just download it manually and copy the necessary files into local64/include and local64/lib.

# Usage
After building, the filter can be used as follows:

`ffmpeg -i input1 -i input2 ... -i inputN -glsl_shader=inputs=N:shader=shader.gls output`

Here, the option `inputs` specifies the number of input videos or images, while `shader` specifies the GLSL shader to apply. A simple example shader has been provided to demonstrate the required format. The uniform `time` is the current timestamp in seconds, and `texturei` is the current frame of the i-th input.