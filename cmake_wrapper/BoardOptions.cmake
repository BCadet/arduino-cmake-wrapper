include(Arduino/PackageManager/BoardsManager)

#install package arduino.samd to build for MKRZERO
BoardManager_InstallPlatform("arduino.samd")
set(ARDUINO_BOARD "Arduino MKRZERO [samd.mkrzero]")
