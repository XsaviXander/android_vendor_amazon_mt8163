# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(TARGET_BUILD_MTK_MEMTRACK),true)

LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_C_INCLUDES += hardware/libhardware/include \
                    vendor/amazon/mt8163/proprietary/hardware/libmemtrack

LOCAL_SHARED_LIBRARIES := liblog \
                          libcutils \
                          libhardware \
                          liblog
LOCAL_SRC_FILES := memtrack_mtk.c memtrack_graphic.c
LOCAL_SRC_FILES += midgard/memtrack_gl.c
LOCAL_HEADER_LIBRARIES := libsystem_headers

LOCAL_MODULE := memtrack.mt8163
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_OWNER := mtk

LOCAL_MULTILIB := both
include $(BUILD_SHARED_LIBRARY)
endif
