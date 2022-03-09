Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843124D3B27
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:34:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 216AE1895;
	Wed,  9 Mar 2022 21:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 216AE1895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646858081;
	bh=igP4IbkxiRcR4CtjK9wm55OF+HvFd8aeJ2uD3T+LoqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TlA+q7IYpcROlWN6fzI8h6tuHPMM3PS9xa+zHMalvN8B88P2CXJFCVuRM6aVrgoal
	 2Mz99pQrs3J6P4GSvJL16c69hSi4idvkmhXY8wibg4Vuhr6luwDYbiAE5wI+93Cw39
	 dvTKtkH0E46XRqiXbjliBU9qp3fO3YItCowjzia8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 317C3F8055B;
	Wed,  9 Mar 2022 21:30:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3DA9F80567; Wed,  9 Mar 2022 21:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF3CBF80557
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF3CBF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T2IUCiM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646857837; x=1678393837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=igP4IbkxiRcR4CtjK9wm55OF+HvFd8aeJ2uD3T+LoqQ=;
 b=T2IUCiM7vI3mgwB0/10VALxADTLVh9+KjLLagWDhivPDtf2dnck9zzd1
 TMAer6ZAOw2pVsfG3KKO/adq7UU8qUWUZbymiWRAjNNdWq8pfvo70tpmt
 IiSoKWcoFG0D2CehmWCNBS/Y/kqu9l7E9YMkg4YOqbkf2jfdN5ZGsQx31
 uhNz/rjUL4/GLj8UG7g8PUQnISc28p4lx07O6iBdCRYaYf0ovEwNa0gSy
 R8fqOTWVLqCmvJlEFD8NMms0sMvlE/Ow62BmfbSArVuui7nHLkqBHlki5
 3SlTTEaRPJZf278lDiuWBEGS4wHFzmto+HUz5BrObdjHucwlVoY+MTVEW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255028790"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="255028790"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 12:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="578527220"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga001.jf.intel.com with ESMTP; 09 Mar 2022 12:30:31 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Date: Wed,  9 Mar 2022 21:40:23 +0100
Message-Id: <20220309204029.89040-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309204029.89040-1-cezary.rojewski@intel.com>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

With basefw runtime parameter handlers added, implement utility
functions to ease pipelines and modules allocation. IDA is enlisted to
help with that.

As firmware is modular and multiple binaries can be loaded on-demand
depending on the streaming scenario, custom firmware caching mechanism
is added.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile |   2 +-
 sound/soc/intel/avs/avs.h    |  37 +++++
 sound/soc/intel/avs/utils.c  | 301 +++++++++++++++++++++++++++++++++++
 3 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/utils.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index c0824f30fd3b..d9f92c5f5407 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 841b8541b101..02d7591d0eac 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -53,12 +53,26 @@ struct avs_spec {
 	const u32 rom_status;
 };
 
+struct avs_fw_entry {
+	char *name;
+	const struct firmware *fw;
+
+	struct list_head node;
+};
+
 /*
  * struct avs_dev - Intel HD-Audio driver data
  *
  * @dev: PCI device
  * @dsp_ba: DSP bar address
  * @spec: platform-specific descriptor
+ * @fw_cfg: Firmware configuration, obtained through FW_CONFIG message
+ * @hw_cfg: Hardware configuration, obtained through HW_CONFIG message
+ * @mods_info: Available module-types, obtained through MODULES_INFO message
+ * @mod_idas: Module instance ID pool, one per module-type
+ * @modres_mutex: For synchronizing any @mods_info updates
+ * @ppl_ida: Pipeline instance ID pool
+ * @fw_list: List of libraries loaded, including base firmware
  */
 struct avs_dev {
 	struct hda_bus base;
@@ -68,6 +82,14 @@ struct avs_dev {
 	const struct avs_spec *spec;
 	struct avs_ipc *ipc;
 
+	struct avs_fw_cfg fw_cfg;
+	struct avs_hw_cfg hw_cfg;
+	struct avs_mods_info *mods_info;
+	struct ida **mod_idas;
+	struct mutex modres_mutex;
+	struct ida ppl_ida;
+	struct list_head fw_list;
+
 	struct completion fw_ready;
 };
 
@@ -168,4 +190,19 @@ void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
 int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
 void avs_ipc_block(struct avs_ipc *ipc);
 
+/* Firmware resources management */
+
+int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
+int avs_get_module_id_entry(struct avs_dev *adev, u32 module_id, struct avs_module_entry *entry);
+int avs_get_module_id(struct avs_dev *adev, const guid_t *uuid);
+bool avs_is_module_ida_empty(struct avs_dev *adev, u32 module_id);
+
+int avs_module_info_init(struct avs_dev *adev, bool purge);
+void avs_module_info_free(struct avs_dev *adev);
+int avs_module_id_alloc(struct avs_dev *adev, u16 module_id);
+void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 instance_id);
+int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, const char *name);
+void avs_release_last_firmware(struct avs_dev *adev);
+void avs_release_firmwares(struct avs_dev *adev);
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
new file mode 100644
index 000000000000..580f3e43fa12
--- /dev/null
+++ b/sound/soc/intel/avs/utils.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/firmware.h>
+#include <linux/slab.h>
+#include "avs.h"
+#include "messages.h"
+
+/* Caller responsible for holding adev->modres_mutex. */
+static int avs_module_entry_index(struct avs_dev *adev, const guid_t *uuid)
+{
+	int i;
+
+	for (i = 0; i < adev->mods_info->count; i++) {
+		struct avs_module_entry *module;
+
+		module = &adev->mods_info->entries[i];
+		if (guid_equal(&module->uuid, uuid))
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+/* Caller responsible for holding adev->modres_mutex. */
+static int avs_module_id_entry_index(struct avs_dev *adev, u32 module_id)
+{
+	int i;
+
+	for (i = 0; i < adev->mods_info->count; i++) {
+		struct avs_module_entry *module;
+
+		module = &adev->mods_info->entries[i];
+		if (module->module_id == module_id)
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry)
+{
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_entry_index(adev, uuid);
+	if (idx >= 0)
+		memcpy(entry, &adev->mods_info->entries[idx], sizeof(*entry));
+
+	mutex_unlock(&adev->modres_mutex);
+	return (idx < 0) ? idx : 0;
+}
+
+int avs_get_module_id_entry(struct avs_dev *adev, u32 module_id, struct avs_module_entry *entry)
+{
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx >= 0)
+		memcpy(entry, &adev->mods_info->entries[idx], sizeof(*entry));
+
+	mutex_unlock(&adev->modres_mutex);
+	return (idx < 0) ? idx : 0;
+}
+
+int avs_get_module_id(struct avs_dev *adev, const guid_t *uuid)
+{
+	struct avs_module_entry module;
+	int ret;
+
+	ret = avs_get_module_entry(adev, uuid, &module);
+	return !ret ? module.module_id : -ENOENT;
+}
+
+bool avs_is_module_ida_empty(struct avs_dev *adev, u32 module_id)
+{
+	bool ret = false;
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx >= 0)
+		ret = ida_is_empty(adev->mod_idas[idx]);
+
+	mutex_unlock(&adev->modres_mutex);
+	return ret;
+}
+
+/* Caller responsible for holding adev->modres_mutex. */
+static void avs_module_ida_destroy(struct avs_dev *adev)
+{
+	int i = adev->mods_info ? adev->mods_info->count : 0;
+
+	while (i--) {
+		ida_destroy(adev->mod_idas[i]);
+		kfree(adev->mod_idas[i]);
+	}
+	kfree(adev->mod_idas);
+}
+
+/* Caller responsible for holding adev->modres_mutex. */
+static int
+avs_module_ida_alloc(struct avs_dev *adev, struct avs_mods_info *newinfo, bool purge)
+{
+	struct avs_mods_info *oldinfo = adev->mods_info;
+	struct ida **ida_ptrs;
+	u32 tocopy_count = 0;
+	int i;
+
+	if (!purge && oldinfo) {
+		if (oldinfo->count >= newinfo->count)
+			dev_warn(adev->dev, "refreshing %d modules info with %d\n",
+				 oldinfo->count, newinfo->count);
+		tocopy_count = oldinfo->count;
+	}
+
+	ida_ptrs = kcalloc(newinfo->count, sizeof(*ida_ptrs), GFP_KERNEL);
+	if (!ida_ptrs)
+		return -ENOMEM;
+
+	if (tocopy_count)
+		memcpy(ida_ptrs, adev->mod_idas, tocopy_count * sizeof(*ida_ptrs));
+
+	for (i = tocopy_count; i < newinfo->count; i++) {
+		ida_ptrs[i] = kzalloc(sizeof(**ida_ptrs), GFP_KERNEL);
+		if (!ida_ptrs[i]) {
+			while (i--)
+				kfree(ida_ptrs[i]);
+
+			kfree(ida_ptrs);
+			return -ENOMEM;
+		}
+
+		ida_init(ida_ptrs[i]);
+	}
+
+	/* If old elements have been reused, don't wipe them. */
+	if (tocopy_count)
+		kfree(adev->mod_idas);
+	else
+		avs_module_ida_destroy(adev);
+
+	adev->mod_idas = ida_ptrs;
+	return 0;
+}
+
+int avs_module_info_init(struct avs_dev *adev, bool purge)
+{
+	struct avs_mods_info *info;
+	int ret;
+
+	ret = avs_ipc_get_modules_info(adev, &info);
+	if (ret)
+		return AVS_IPC_RET(ret);
+
+	mutex_lock(&adev->modres_mutex);
+
+	ret = avs_module_ida_alloc(adev, info, purge);
+	if (ret < 0) {
+		dev_err(adev->dev, "initialize module idas failed: %d\n", ret);
+		goto exit;
+	}
+
+	/* Refresh current information with newly received table. */
+	kfree(adev->mods_info);
+	adev->mods_info = info;
+
+exit:
+	mutex_unlock(&adev->modres_mutex);
+	return ret;
+}
+
+void avs_module_info_free(struct avs_dev *adev)
+{
+	mutex_lock(&adev->modres_mutex);
+
+	avs_module_ida_destroy(adev);
+	kfree(adev->mods_info);
+	adev->mods_info = NULL;
+
+	mutex_unlock(&adev->modres_mutex);
+}
+
+int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
+{
+	int ret, idx, max_id;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx == -ENOENT) {
+		WARN(1, "invalid module id: %d", module_id);
+		ret = -EINVAL;
+		goto exit;
+	}
+	max_id = adev->mods_info->entries[idx].instance_max_count - 1;
+	ret = ida_alloc_max(adev->mod_idas[idx], max_id, GFP_KERNEL);
+exit:
+	mutex_unlock(&adev->modres_mutex);
+	return ret;
+}
+
+void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 instance_id)
+{
+	int idx;
+
+	mutex_lock(&adev->modres_mutex);
+
+	idx = avs_module_id_entry_index(adev, module_id);
+	if (idx == -ENOENT) {
+		WARN(1, "invalid module id: %d", module_id);
+		goto exit;
+	}
+
+	ida_free(adev->mod_idas[idx], instance_id);
+exit:
+	mutex_unlock(&adev->modres_mutex);
+}
+
+/*
+ * Once driver loads FW it should keep it in memory, so we are not affected
+ * by FW removal from filesystem or even worse by loading different FW at
+ * runtime suspend/resume.
+ */
+int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, const char *name)
+{
+	struct avs_fw_entry *entry;
+	int ret;
+
+	/* first check in list if it is not already loaded */
+	list_for_each_entry(entry, &adev->fw_list, node) {
+		if (!strcmp(name, entry->name)) {
+			*fw_p = entry->fw;
+			return 0;
+		}
+	}
+
+	/* FW is not loaded, let's load it now and add to the list */
+	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->name = kstrdup(name, GFP_KERNEL);
+	if (!entry->name) {
+		kfree(entry);
+		return -ENOMEM;
+	}
+
+	ret = request_firmware(&entry->fw, name, adev->dev);
+	if (ret < 0) {
+		kfree(entry->name);
+		kfree(entry);
+		return ret;
+	}
+
+	*fw_p = entry->fw;
+
+	list_add_tail(&entry->node, &adev->fw_list);
+
+	return 0;
+}
+
+/*
+ * Release single FW entry, used to handle errors in functions calling
+ * avs_request_firmware()
+ */
+void avs_release_last_firmware(struct avs_dev *adev)
+{
+	struct avs_fw_entry *entry;
+
+	entry = list_last_entry(&adev->fw_list, typeof(*entry), node);
+
+	list_del(&entry->node);
+	release_firmware(entry->fw);
+	kfree(entry->name);
+	kfree(entry);
+}
+
+/*
+ * Release all FW entries, used on driver removal
+ */
+void avs_release_firmwares(struct avs_dev *adev)
+{
+	struct avs_fw_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &adev->fw_list, node) {
+		list_del(&entry->node);
+		release_firmware(entry->fw);
+		kfree(entry->name);
+		kfree(entry);
+	}
+}
-- 
2.25.1

