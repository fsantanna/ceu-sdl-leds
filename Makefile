include Makefile.dirs

each:
	for i in src/led-*.ceu; do                                              \
		echo;                                                               \
		echo "###############################################";             \
		echo File: "$$i -> /tmp/$$(basename $$i .ceu)";	                    \
		echo "###############################################";             \
		echo -n "Press <enter> to start...";                                \
		read _;                                                             \
	    ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include" \
	              --pre-input=$$i                                           \
	        --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass        \
	        --env --env-types=$(CEU_DIR)/env/types.h                        \
	              --env-threads=$(CEU_DIR)/env/threads.h                    \
	              --env-main=$(CEU_DIR)/env/main.c                          \
	        --cc --cc-args="-DSDL_MATH -lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	             --cc-output=/tmp/$$(basename $$i .ceu);                    \
		/tmp/$$(basename $$i .ceu);	                                        \
		echo ">>> OK";                                                      \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
	done

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include" \
	          --pre-input=src/all.ceu                                    \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass         \
	    --env --env-types=$(CEU_DIR)/env/types.h                         \
	          --env-threads=$(CEU_DIR)/env/threads.h                     \
	          --env-main=$(CEU_DIR)/env/main.c                           \
	          --env-output=/tmp/leds-all.c \
	    --cc --cc-args="-DSDL_MATH -lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	         --cc-output=/tmp/leds-all
	/tmp/leds-all

.PHONY: all
