#!/bin/bash

# Force to the suite to think the package has updates to recompile.
# Alternatively, you can use "touch recompile" for a similar effect.
touch custom_updated

FFMPEG_OPTS+=(--extra-libs="-lglew32s -lmingw32 -lopengl32")

_pre_configure(){
	# Installs glew
	#do_pacman_install glew
	# Apply a local patch inside the directory where is "ffmpeg_extra.sh"
	patch -p1 -i "$LOCALBUILDDIR/ffmpeg_glsl_shader.patch"
}

_post_make(){
	# Don't run configure again.
	touch "$(get_first_subdir)/do_not_reconfigure"
	# Don't clean the build folder on each successive run.
	# This is for if you want to keep the current build folder as is and just recompile only.
	touch "$(get_first_subdir)/do_not_clean"
}