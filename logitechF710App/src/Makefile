TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = logitechF710
# logitechF710.dbd will be created and installed
DBD += logitechF710.dbd

# logitechF710.dbd will be made up from these files:
logitechF710_DBD += base.dbd

# Include dbd files from all support applications:
#logitechF710_DBD += xxx.dbd
logitechF710_DBD += usb.dbd
logitechF710_DBD += asyn.dbd
logitechF710_DBD += asSupport.dbd

# Add all the support libraries needed by this IOC
###logitechF710_LIBS += logitechF710Support
logitechF710_LIBS += asyn usb autosave


# logitechF710_registerRecordDeviceDriver.cpp derives from logitechF710.dbd
logitechF710_SRCS += logitechF710_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
logitechF710_SRCS_DEFAULT += logitechF710Main.cpp
logitechF710_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#logitechF710_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
logitechF710_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

