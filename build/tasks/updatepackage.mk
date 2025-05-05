# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
# Copyright (C) 2018 CarbonROM
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

include vendor/lineage/build/core/colors.mk

LINEAGE_TARGET_UPDATEPACKAGE := $(PRODUCT_OUT)/lineage-$(LINEAGE_VERSION)-img.zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: updatepackage
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	@echo "LineageOS Fastboot package"
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(LINEAGE_TARGET_UPDATEPACKAGE)
	$(hide) $(SHA256) $(LINEAGE_TARGET_UPDATEPACKAGE) > $(LINEAGE_TARGET_UPDATEPACKAGE).sha256sum
	@echo ""
	@echo -e ${CL_YLW}"═══════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ${CL_CYN}"Fastboot zip:   "${CL_MAG} lineage-$(LINEAGE_VERSION)-img.zip ${CL_RST}
	@echo -e ${CL_CYN}"Package folder: "${CL_MAG} $(PRODUCT_OUT) ${CL_RST}
	@echo -e ${CL_CYN}"Package sha256: "${CL_MAG} $(shell cat $(LINEAGE_TARGET_UPDATEPACKAGE).sha256sum | awk '{print $$1}') ${CL_RST}
	@echo -e ${CL_CYN}"Package size:   "${CL_MAG} $(shell du -h $(LINEAGE_TARGET_UPDATEPACKAGE) | awk '{print $$1}') ${CL_RST}
	@echo -e ${CL_YLW}"═══════════════════════════════════════════════════════════════════"${CL_RST}
	@echo -e ""

.PHONY: updatepackage
