GO_EASY_ON_ME=1
include theos/makefiles/common.mk
archs=armv7 arm64

TWEAK_NAME = BloonsTDBattles
BloonsTDBattles_FILES = Tweak.xm
BloonsTDBattles_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
