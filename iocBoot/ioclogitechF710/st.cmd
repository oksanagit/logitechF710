#!../../bin/linux-x86_64/logitechF710

#- You may have to change logitechF710 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("PORT", GPC)
epicsEnvSet("PREFIX","XF:08ID1-ES{GP}")
epicsEnvSet("INSTANCE", SMPL)

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/logitechF710.dbd"
logitechF710_registerRecordDeviceDriver pdbbase

usbCreateDriver("$(PORT)", "db/LogitechF710-DirectX.in")

##usbSetDebugLevel("$(PORT)", 10)
usbSetTimeout("$(PORT)", 1000)
#usbShowIO("$(PORT)", ON/OFF)
usbShowIO("$(PORT)", 1)

usbConnectDevice("$(PORT)", 0, 0x046d, 0xc219)

dbLoadRecords("db/LogitechF710.db", "P=$(PREFIX),R=$(INSTANCE):,PORT=$(PORT)")

# save things every thirty seconds
set_requestfile_path("./")
set_requestfile_path("$(TOP)/usbApp/Db")
set_requestfile_path("$(TOP)/iocBoot")
set_savefile_path("./autosave")
set_pass0_restoreFile("auto_settings.sav")
set_pass1_restoreFile("auto_settings.sav")
save_restoreSet_status_prefix("$(PREFIX)")
dbLoadRecords("$(AUTOSAVE)/asApp/Db/save_restoreStatus.db", "P=$(PREFIX)")


#- Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

# Save every 30 seconds
##create_monitor_set("LogitechF710_settings.req", 30)
create_monitor_set("auto_settings.req", 30, "P=$(PREFIX), R=$(INSTANCE):")

## Start any sequence programs
#seq sncExample, "user=oksana"
